import csv
import re
from pathlib import Path

INPUT_CSV = "m.csv"
ANNOTATION_FILE = "dbsnp_annotations.cypher"

OUT_IMPORT = "neo4j_import.cypher"
OUT_CHEMISTRY = "neo4j_chemistry.cypher"
OUT_ANNOTATIONS = "dbsnp_annotations.cypher"


AA = {
    "A": ("Alanine", "neutral", "nonpolar", "small", "hydrophobic"),
    "R": ("Arginine", "positive", "polar", "large", "hydrophilic"),
    "N": ("Asparagine", "neutral", "polar", "medium", "hydrophilic"),
    "D": ("Aspartic acid", "negative", "polar", "medium", "hydrophilic"),
    "C": ("Cysteine", "neutral", "polar", "small", "hydrophobic"),
    "Q": ("Glutamine", "neutral", "polar", "large", "hydrophilic"),
    "E": ("Glutamic acid", "negative", "polar", "large", "hydrophilic"),
    "G": ("Glycine", "neutral", "nonpolar", "tiny", "hydrophobic"),
    "H": ("Histidine", "positive", "polar", "medium", "hydrophilic"),
    "I": ("Isoleucine", "neutral", "nonpolar", "large", "hydrophobic"),
    "L": ("Leucine", "neutral", "nonpolar", "large", "hydrophobic"),
    "K": ("Lysine", "positive", "polar", "large", "hydrophilic"),
    "M": ("Methionine", "neutral", "nonpolar", "large", "hydrophobic"),
    "F": ("Phenylalanine", "neutral", "nonpolar", "large", "hydrophobic"),
    "P": ("Proline", "neutral", "nonpolar", "small", "hydrophobic"),
    "S": ("Serine", "neutral", "polar", "small", "hydrophilic"),
    "T": ("Threonine", "neutral", "polar", "small", "hydrophilic"),
    "W": ("Tryptophan", "neutral", "nonpolar", "large", "hydrophobic"),
    "Y": ("Tyrosine", "neutral", "polar", "large", "hydrophilic"),
    "V": ("Valine", "neutral", "nonpolar", "medium", "hydrophobic"),
}


def clean(value):
    if value is None:
        return ""

    value = str(value).strip()

    if value.upper() in {"NULL", "NA", "N/A", ""}:
        return ""

    return value


def q(value):
    return '"' + clean(value).replace("\\", "\\\\").replace('"', '\\"') + '"'


def read_csv(path):
    rows = []

    with open(path, newline="", encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)

        for row in reader:
            rows.append({k: clean(v) for k, v in row.items()})

    return rows


def write_import_script(rows):

    patients = sorted({
        r["patient_tcga_id"]
        for r in rows
        if r["patient_tcga_id"]
    })

    genes = sorted({
        r["hugo_symbol"]
        for r in rows
        if r["hugo_symbol"]
    })

    consequences = sorted({
        r["consequence"]
        for r in rows
        if r["consequence"]
    })

    snps = {}

    for r in rows:

        rs = r["dbsnp_rs"]

        if rs and rs not in snps:

            snps[rs] = {
                "variant_type": r.get("variant_type", ""),
                "hgvsp_short": r.get("hgvsp_short", "")
            }

    lines = [

        "// Neo4j Import Script",
        "",

        "CREATE CONSTRAINT IF NOT EXISTS FOR (p:Patient) REQUIRE p.tcga_id IS UNIQUE;",
        "CREATE CONSTRAINT IF NOT EXISTS FOR (g:Gene) REQUIRE g.hugo_symbol IS UNIQUE;",
        "CREATE CONSTRAINT IF NOT EXISTS FOR (s:SNP) REQUIRE s.dbsnp_rs IS UNIQUE;",
        "CREATE CONSTRAINT IF NOT EXISTS FOR (c:Consequence) REQUIRE c.consequence IS UNIQUE;",
        "",

        "// Patient Nodes"
    ]

    for p in patients:
        lines.append(
            f'MERGE (:Patient {{tcga_id: {q(p)}}});'
        )

    lines.append("")
    lines.append("// Gene Nodes")

    for g in genes:
        lines.append(
            f'MERGE (:Gene {{hugo_symbol: {q(g)}}});'
        )

    lines.append("")
    lines.append("// SNP Nodes")

    for rs, data in snps.items():

        props = [f"dbsnp_rs: {q(rs)}"]

        if data["variant_type"]:
            props.append(
                f'variant_type: {q(data["variant_type"])}'
            )

        if data["hgvsp_short"]:
            props.append(
                f'hgvsp_short: {q(data["hgvsp_short"])}'
            )

        lines.append(
            f'MERGE (:SNP {{{", ".join(props)}}});'
        )

    lines.append("")
    lines.append("// Consequence Nodes")

    for c in consequences:
        lines.append(
            f'MERGE (:Consequence {{consequence: {q(c)}}});'
        )

    lines.append("")
    lines.append("// Relationships")

    seen = set()

    for r in rows:

        rs = r["dbsnp_rs"]
        gene = r["hugo_symbol"]
        patient = r["patient_tcga_id"]
        consequence = r["consequence"]

        if rs and gene and (rs, gene, "gene") not in seen:

            lines.append(
                f'MATCH (s:SNP {{dbsnp_rs: {q(rs)}}}), '
                f'(g:Gene {{hugo_symbol: {q(gene)}}}) '
                f'MERGE (s)-[:LOCATED_IN]->(g);'
            )

            seen.add((rs, gene, "gene"))

        if rs and patient and (rs, patient, "patient") not in seen:

            lines.append(
                f'MATCH (s:SNP {{dbsnp_rs: {q(rs)}}}), '
                f'(p:Patient {{tcga_id: {q(patient)}}}) '
                f'MERGE (s)-[:FOUND_IN_PATIENT]->(p);'
            )

            seen.add((rs, patient, "patient"))

        if rs and consequence and (rs, consequence, "consequence") not in seen:

            lines.append(
                f'MATCH (s:SNP {{dbsnp_rs: {q(rs)}}}), '
                f'(c:Consequence {{consequence: {q(consequence)}}}) '
                f'MERGE (s)-[:HAS_CONSEQUENCE]->(c);'
            )

            seen.add((rs, consequence, "consequence"))

    Path(OUT_IMPORT).write_text(
        "\n".join(lines),
        encoding="utf-8"
    )


def parse_hgvsp(hgvsp):

    match = re.match(
        r"^p\.([A-Z])(\d+)([A-Z])$",
        hgvsp
    )

    if not match:
        return None

    return (
        match.group(1),
        int(match.group(2)),
        match.group(3)
    )


def write_chemistry_script(rows):

    snps = {}

    for r in rows:

        rs = r["dbsnp_rs"]

        if rs and rs not in snps:
            snps[rs] = r

    lines = [
        "// Neo4j Amino Acid Chemistry Annotation Script",
        ""
    ]

    for rs, r in sorted(snps.items()):

        hgvsp = r.get("hgvsp_short", "")

        parsed = parse_hgvsp(hgvsp)

        lines.append(
            f"// {rs} - {r.get('hugo_symbol', '')}"
        )

        lines.append(
            f'MATCH (s:SNP {{dbsnp_rs: {q(rs)}}})'
        )

        if parsed:

            original, position, mutant = parsed

            o = AA.get(original)
            m = AA.get(mutant)

            if o and m:

                changes = []

                labels = [
                    "Charge",
                    "Polarity",
                    "Size",
                    "Hydrophobicity"
                ]

                for i, label in enumerate(labels, start=1):

                    if o[i] != m[i]:

                        changes.append(
                            f"{label}: {o[i]} -> {m[i]}"
                        )

                property_change = (
                    "; ".join(changes)
                    if changes
                    else "No major amino acid property change"
                )

                lines.append(
                    "SET "
                    f's.original_aa = {q(o[0])},\n'
                    f'    s.original_aa_charge = {q(o[1])},\n'
                    f'    s.original_aa_polarity = {q(o[2])},\n'
                    f'    s.original_aa_size = {q(o[3])},\n'
                    f'    s.original_aa_hydrophobicity = {q(o[4])},\n'
                    f'    s.mutant_aa = {q(m[0])},\n'
                    f'    s.mutant_aa_charge = {q(m[1])},\n'
                    f'    s.mutant_aa_polarity = {q(m[2])},\n'
                    f'    s.mutant_aa_size = {q(m[3])},\n'
                    f'    s.mutant_aa_hydrophobicity = {q(m[4])},\n'
                    f'    s.property_change = {q(property_change)},\n'
                    f'    s.aa_position = {position};'
                )

            else:

                lines.append(
                    'SET s.property_change = "Unknown amino acid code";'
                )

        else:

            lines.append(
                'SET s.property_change = "Non-coding or unsupported protein change",\n'
                '    s.structural_impact = "Potential transcript or regulatory effect";'
            )

        lines.append("")

    Path(OUT_CHEMISTRY).write_text(
        "\n".join(lines),
        encoding="utf-8"
    )


def write_annotation_script():

    source = Path(ANNOTATION_FILE)

    if source.exists():

        try:
            text = source.read_text(encoding="utf-8")

        except UnicodeDecodeError:

            text = source.read_text(encoding="latin-1")

        Path(OUT_ANNOTATIONS).write_text(
            text,
            encoding="utf-8"
        )

    else:

        Path(OUT_ANNOTATIONS).write_text(
            "// No dbSNP annotation file found.\n",
            encoding="utf-8"
        )


def main():

    rows = read_csv(INPUT_CSV)

    write_import_script(rows)

    write_chemistry_script(rows)

    write_annotation_script()

    print("Neo4j scripts generated successfully:")
    print(f" - {OUT_IMPORT}")
    print(f" - {OUT_CHEMISTRY}")
    print(f" - {OUT_ANNOTATIONS}")


if __name__ == "__main__":
    main()