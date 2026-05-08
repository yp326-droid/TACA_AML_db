// =============================================
// Add amino acid chemistry properties to SNP nodes
// =============================================

// rs104886029 - KRAS - p.A59E
MATCH (s:SNP {dbsnp_rs: "rs104886029"})
SET s.original_aa = "Alanine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "nonpolar",
    s.original_aa_size = "small",
    s.original_aa_hydrophobicity = "hydrophobic",
    s.mutant_aa = "Glutamic acid",
    s.mutant_aa_charge = "negative",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Charge: neutral -> negative; Polarity: nonpolar -> polar; Size: small -> large; Hydrophobicity: hydrophobic -> hydrophilic",
    s.aa_position = 59;

// rs112445441 - KRAS - p.G13D
MATCH (s:SNP {dbsnp_rs: "rs112445441"})
SET s.original_aa = "Glycine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "nonpolar",
    s.original_aa_size = "tiny",
    s.original_aa_hydrophobicity = "hydrophobic",
    s.mutant_aa = "Aspartic acid",
    s.mutant_aa_charge = "negative",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "medium",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Charge: neutral -> negative; Polarity: nonpolar -> polar; Size: tiny -> medium; Hydrophobicity: hydrophobic -> hydrophilic",
    s.aa_position = 13;

// rs113581628 - ZNF175 - INS (no missense protein change)
MATCH (s:SNP {dbsnp_rs: "rs113581628"})
SET s.property_change = "Non-coding or splice region variant",
    s.structural_impact = "May affect gene regulation or splicing";

// rs11554290 - NRAS - p.Q61P
MATCH (s:SNP {dbsnp_rs: "rs11554290"})
SET s.original_aa = "Glutamine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Proline",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "nonpolar",
    s.mutant_aa_size = "small",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Polarity: polar -> nonpolar; Size: large -> small; Hydrophobicity: hydrophilic -> hydrophobic",
    s.aa_position = 61;

// rs121434596 - NRAS - p.G13D
MATCH (s:SNP {dbsnp_rs: "rs121434596"})
SET s.original_aa = "Glycine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "nonpolar",
    s.original_aa_size = "tiny",
    s.original_aa_hydrophobicity = "hydrophobic",
    s.mutant_aa = "Aspartic acid",
    s.mutant_aa_charge = "negative",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "medium",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Charge: neutral -> negative; Polarity: nonpolar -> polar; Size: tiny -> medium; Hydrophobicity: hydrophobic -> hydrophilic",
    s.aa_position = 13;

// rs121907900 - WT1 - p.R462W
MATCH (s:SNP {dbsnp_rs: "rs121907900"})
SET s.original_aa = "Arginine",
    s.original_aa_charge = "positive",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Tryptophan",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "nonpolar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Charge: positive -> neutral; Polarity: polar -> nonpolar; Hydrophobicity: hydrophilic -> hydrophobic",
    s.aa_position = 462;

// rs121912880 - COL2A1 - p.G504C
MATCH (s:SNP {dbsnp_rs: "rs121912880"})
SET s.original_aa = "Glycine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "nonpolar",
    s.original_aa_size = "tiny",
    s.original_aa_hydrophobicity = "hydrophobic",
    s.mutant_aa = "Cysteine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "small",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Polarity: nonpolar -> polar; Size: tiny -> small",
    s.aa_position = 504;

// rs121913237 - NRAS - p.G12D
MATCH (s:SNP {dbsnp_rs: "rs121913237"})
SET s.original_aa = "Glycine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "nonpolar",
    s.original_aa_size = "tiny",
    s.original_aa_hydrophobicity = "hydrophobic",
    s.mutant_aa = "Aspartic acid",
    s.mutant_aa_charge = "negative",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "medium",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Charge: neutral -> negative; Polarity: nonpolar -> polar; Size: tiny -> medium; Hydrophobicity: hydrophobic -> hydrophilic",
    s.aa_position = 12;

// rs121913250 - NRAS - p.G12C
MATCH (s:SNP {dbsnp_rs: "rs121913250"})
SET s.original_aa = "Glycine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "nonpolar",
    s.original_aa_size = "tiny",
    s.original_aa_hydrophobicity = "hydrophobic",
    s.mutant_aa = "Cysteine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "small",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Polarity: nonpolar -> polar; Size: tiny -> small",
    s.aa_position = 12;

// rs121913254 - NRAS - p.Q61K
MATCH (s:SNP {dbsnp_rs: "rs121913254"})
SET s.original_aa = "Glutamine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Lysine",
    s.mutant_aa_charge = "positive",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Charge: neutral -> positive",
    s.aa_position = 61;

// rs121913255 - NRAS - p.Q61H
MATCH (s:SNP {dbsnp_rs: "rs121913255"})
SET s.original_aa = "Glutamine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Histidine",
    s.mutant_aa_charge = "positive",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Charge: neutral -> positive",
    s.aa_position = 61;

// rs121913343 - TP53 - p.R273C
MATCH (s:SNP {dbsnp_rs: "rs121913343"})
SET s.original_aa = "Arginine",
    s.original_aa_charge = "positive",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Cysteine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "small",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Charge: positive -> neutral; Size: large -> small; Hydrophobicity: hydrophilic -> hydrophobic",
    s.aa_position = 273;

// rs121913499 - IDH1 - p.R132C
MATCH (s:SNP {dbsnp_rs: "rs121913499"})
SET s.original_aa = "Arginine",
    s.original_aa_charge = "positive",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Cysteine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "small",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Charge: positive -> neutral; Size: large -> small; Hydrophobicity: hydrophilic -> hydrophobic",
    s.aa_position = 132;

// rs121913500 - IDH1 - p.R132H
MATCH (s:SNP {dbsnp_rs: "rs121913500"})
SET s.original_aa = "Arginine",
    s.original_aa_charge = "positive",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Histidine",
    s.mutant_aa_charge = "positive",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Conservative (similar properties)",
    s.aa_position = 132;

// rs121913506 - KIT - p.D816Y
MATCH (s:SNP {dbsnp_rs: "rs121913506"})
SET s.original_aa = "Aspartic acid",
    s.original_aa_charge = "negative",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "medium",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Tyrosine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Charge: negative -> neutral; Size: medium -> large; Hydrophobicity: hydrophilic -> hydrophobic",
    s.aa_position = 816;

// rs121913507 - KIT - p.D816V
MATCH (s:SNP {dbsnp_rs: "rs121913507"})
SET s.original_aa = "Aspartic acid",
    s.original_aa_charge = "negative",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "medium",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Valine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "nonpolar",
    s.mutant_aa_size = "medium",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Charge: negative -> neutral; Polarity: polar -> nonpolar; Hydrophobicity: hydrophilic -> hydrophobic",
    s.aa_position = 816;

// rs121913527 - KRAS - p.A146T
MATCH (s:SNP {dbsnp_rs: "rs121913527"})
SET s.original_aa = "Alanine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "nonpolar",
    s.original_aa_size = "small",
    s.original_aa_hydrophobicity = "hydrophobic",
    s.mutant_aa = "Threonine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "medium",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Polarity: nonpolar -> polar; Size: small -> medium; Hydrophobicity: hydrophobic -> hydrophilic",
    s.aa_position = 146;

// rs121913529 - KRAS - p.G12D
MATCH (s:SNP {dbsnp_rs: "rs121913529"})
SET s.original_aa = "Glycine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "nonpolar",
    s.original_aa_size = "tiny",
    s.original_aa_hydrophobicity = "hydrophobic",
    s.mutant_aa = "Aspartic acid",
    s.mutant_aa_charge = "negative",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "medium",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Charge: neutral -> negative; Polarity: nonpolar -> polar; Size: tiny -> medium; Hydrophobicity: hydrophobic -> hydrophilic",
    s.aa_position = 12;

// rs121918454 - PTPN11 - p.A72V
MATCH (s:SNP {dbsnp_rs: "rs121918454"})
SET s.original_aa = "Alanine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "nonpolar",
    s.original_aa_size = "small",
    s.original_aa_hydrophobicity = "hydrophobic",
    s.mutant_aa = "Valine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "nonpolar",
    s.mutant_aa_size = "medium",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Size: small -> medium",
    s.aa_position = 72;

// rs121918458 - PTPN11 - p.S502P
MATCH (s:SNP {dbsnp_rs: "rs121918458"})
SET s.original_aa = "Serine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "small",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Proline",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "nonpolar",
    s.mutant_aa_size = "small",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Polarity: polar -> nonpolar; Hydrophobicity: hydrophilic -> hydrophobic",
    s.aa_position = 502;

// rs121918470 - PTPN11 - p.Q510L
MATCH (s:SNP {dbsnp_rs: "rs121918470"})
SET s.original_aa = "Glutamine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Leucine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "nonpolar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Polarity: polar -> nonpolar; Hydrophobicity: hydrophilic -> hydrophobic",
    s.aa_position = 510;

// rs121918697 - THRB - p.R338W
MATCH (s:SNP {dbsnp_rs: "rs121918697"})
SET s.original_aa = "Arginine",
    s.original_aa_charge = "positive",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Tryptophan",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "nonpolar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Charge: positive -> neutral; Polarity: polar -> nonpolar; Hydrophobicity: hydrophilic -> hydrophobic",
    s.aa_position = 338;

// rs137853227 - GNAI2 - p.R179H
MATCH (s:SNP {dbsnp_rs: "rs137853227"})
SET s.original_aa = "Arginine",
    s.original_aa_charge = "positive",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Histidine",
    s.mutant_aa_charge = "positive",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Conservative (similar properties)",
    s.aa_position = 179;

// rs137854556 - NF1 - p.R1276Q
MATCH (s:SNP {dbsnp_rs: "rs137854556"})
SET s.original_aa = "Arginine",
    s.original_aa_charge = "positive",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Glutamine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Charge: positive -> neutral",
    s.aa_position = 1276;

// rs17851045 - KRAS - p.Q61H
MATCH (s:SNP {dbsnp_rs: "rs17851045"})
SET s.original_aa = "Glutamine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Histidine",
    s.mutant_aa_charge = "positive",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Charge: neutral -> positive",
    s.aa_position = 61;

// rs181856403 - GPR123 - p.T38I
MATCH (s:SNP {dbsnp_rs: "rs181856403"})
SET s.original_aa = "Threonine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "medium",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Isoleucine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "nonpolar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Polarity: polar -> nonpolar; Size: medium -> large; Hydrophobicity: hydrophilic -> hydrophobic",
    s.aa_position = 38;

// rs33981747 - NFKBIZ - INS (no missense protein change)
MATCH (s:SNP {dbsnp_rs: "rs33981747"})
SET s.property_change = "Non-coding or splice region variant",
    s.structural_impact = "May affect gene regulation or splicing";

// rs34051457 - CRIPAK - p.T17Vfs*390
MATCH (s:SNP {dbsnp_rs: "rs34051457"})
SET s.original_aa = "Threonine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "medium",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Valine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "nonpolar",
    s.mutant_aa_size = "medium",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Polarity: polar -> nonpolar; Hydrophobicity: hydrophilic -> hydrophobic",
    s.aa_position = 17;

// rs55863639 - TP53 - SNP (no missense protein change)
MATCH (s:SNP {dbsnp_rs: "rs55863639"})
SET s.property_change = "Non-coding or splice region variant",
    s.structural_impact = "May affect gene regulation or splicing";

// rs56185003 - DCLK1 - p.R292H
MATCH (s:SNP {dbsnp_rs: "rs56185003"})
SET s.original_aa = "Arginine",
    s.original_aa_charge = "positive",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Histidine",
    s.mutant_aa_charge = "positive",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Conservative (similar properties)",
    s.aa_position = 292;

// rs61112029 - RP3-393E18.1 - INS (no missense protein change)
MATCH (s:SNP {dbsnp_rs: "rs61112029"})
SET s.property_change = "Non-coding or splice region variant",
    s.structural_impact = "May affect gene regulation or splicing";

// rs61397759 - ZNF681 - p.C203Wfs*5
MATCH (s:SNP {dbsnp_rs: "rs61397759"})
SET s.original_aa = "Cysteine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "small",
    s.original_aa_hydrophobicity = "hydrophobic",
    s.mutant_aa = "Tryptophan",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "nonpolar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Polarity: polar -> nonpolar; Size: small -> large",
    s.aa_position = 203;

// rs71818662 - IL32 - p.D172Gfs*12
MATCH (s:SNP {dbsnp_rs: "rs71818662"})
SET s.original_aa = "Aspartic acid",
    s.original_aa_charge = "negative",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "medium",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Glycine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "nonpolar",
    s.mutant_aa_size = "tiny",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Charge: negative -> neutral; Polarity: polar -> nonpolar; Size: medium -> tiny; Hydrophobicity: hydrophilic -> hydrophobic",
    s.aa_position = 172;

// rs71889021 - DPYS - DEL (no missense protein change)
MATCH (s:SNP {dbsnp_rs: "rs71889021"})
SET s.property_change = "Non-coding or splice region variant",
    s.structural_impact = "May affect gene regulation or splicing";

// rs74315450 - RUNX1 - p.R201Q
MATCH (s:SNP {dbsnp_rs: "rs74315450"})
SET s.original_aa = "Arginine",
    s.original_aa_charge = "positive",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Glutamine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "polar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophilic",
    s.property_change = "Charge: positive -> neutral",
    s.aa_position = 201;

// rs77375493 - JAK2 - p.V617F
MATCH (s:SNP {dbsnp_rs: "rs77375493"})
SET s.original_aa = "Valine",
    s.original_aa_charge = "neutral",
    s.original_aa_polarity = "nonpolar",
    s.original_aa_size = "medium",
    s.original_aa_hydrophobicity = "hydrophobic",
    s.mutant_aa = "Phenylalanine",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "nonpolar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Size: medium -> large",
    s.aa_position = 617;

// rs80338758 - MED12 - p.R961W
MATCH (s:SNP {dbsnp_rs: "rs80338758"})
SET s.original_aa = "Arginine",
    s.original_aa_charge = "positive",
    s.original_aa_polarity = "polar",
    s.original_aa_size = "large",
    s.original_aa_hydrophobicity = "hydrophilic",
    s.mutant_aa = "Tryptophan",
    s.mutant_aa_charge = "neutral",
    s.mutant_aa_polarity = "nonpolar",
    s.mutant_aa_size = "large",
    s.mutant_aa_hydrophobicity = "hydrophobic",
    s.property_change = "Charge: positive -> neutral; Polarity: polar -> nonpolar; Hydrophobicity: hydrophilic -> hydrophobic",
    s.aa_position = 961;
