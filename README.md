# TACA_AML_db
A relational database for Acute Myeloid Leukemia (AML) data from The Cancer Genome Atlas (TCGA) Firehose Legacy pipeline. 

# Project Summary
A relational (MySQL) and graph (Neo4j) database for Acute Myeloid Leukemia (AML) data from The Cancer Genome Atlas (TCGA) Firehose Legacy pipeline. The database integrates patient demographics, sample records, mutation profiles, and RSEM gene expression data from 200 AML patients, enabling analysis of mutation-gene expression relationships and gaining meaningful biological insights.

## Tools and Technologies
- **DBMS:** MySQL 9.5.0, Neo4j
- **Administration:** phpMyAdmin 5.2.3
- **Programming:** Python 3, SQL, Cypher
- **Environment:** Oracle VM VirtualBox, Linux Fedora

## Repository Structure
```text
TCGA_AML_db/
│
├── TCGA_AML_neo4j.dump.gz  ## Compressed full Neo4j graph database export. 
├── TCGA_AML_db.sql.gz  ## Compressed full MySQL database export.
├── .gitignore
├── README.md
│
├── data/
│   ├── raw_data/ ## Original unmodified TCGA Firehose Legacy files
│   │   ├── clinical/
│   │   │   ├── data_clinical_patient.txt
│   │   │   ├── data_clinical_sample.txt
│   │   │   ├── meta_clinical_patient.txt
│   │   │   └── meta_clinical_sample.txt
│   │   │
│   │   ├── expression/
│   │   │   ├── data_mrna_seq_rpkm.txt
│   │   │   ├── data_mrna_seq_rpkm_zscores_ref_all_samples.txt
│   │   │   ├── data_mrna_seq_rpkm_zscores_ref_diploid_samples.txt
│   │   │   ├── data_mrna_seq_v2_rsem.txt
│   │   │   ├── data_mrna_seq_v2_rsem_zscores_ref_all_samples.txt
│   │   │   ├── data_mrna_seq_v2_rsem_zscores_ref_diploid_samples.txt
│   │   │   ├── meta_mrna_seq_rpkm.txt
│   │   │   ├── meta_mrna_seq_rpkm_zscores_ref_all_samples.txt
│   │   │   ├── meta_mrna_seq_rpkm_zscores_ref_diploid_samples.txt
│   │   │   ├── meta_mrna_seq_v2_rsem.txt
│   │   │   ├── meta_mrna_seq_v2_rsem_zscores_ref_all_samples.txt
│   │   │   └── meta_mrna_seq_v2_rsem_zscores_ref_diploid_samples.txt
│   │   │
│   │   ├── mutations/
│   │   │   ├── data_mutations.txt
│   │   │   └── meta_mutations.txt
│   │   │
│   │   ├── copy_number/
│   │   │   ├── data_cna.txt
│   │   │   ├── data_cna_hg19.seg
│   │   │   ├── data_gistic_genes_amp.txt
│   │   │   ├── data_gistic_genes_del.txt
│   │   │   ├── data_linear_cna.txt
│   │   │   ├── meta_cna.txt
│   │   │   ├── meta_cna_hg19_seg.txt
│   │   │   ├── meta_gistic_genes_amp.txt
│   │   │   ├── meta_gistic_genes_del.txt
│   │   │   └── meta_linear_cna.txt
│   │   │
│   │   ├── methylation/
│   │   │   ├── data_methylation_hm27.txt
│   │   │   ├── data_methylation_hm450.txt
│   │   │   ├── meta_methylation_hm27.txt
│   │   │   └── meta_methylation_hm450.txt
│   │   │
│   │   └── metadata/
│   │       ├── LICENSE
│   │       ├── meta_study.txt
│   │       └── README.txt
│   │
│   └── cleaned_data/ ## Cleaned versions of data
│       ├── data_clinical_patient.csv
│       ├── data_clinical_sample.csv
│       ├── data_mrna_seq_v2_rsem_mismatch_removed.csv
│       └── data_mutations_mismatch_removed.csv
│
├── diagrams/ ## Database schema diagrams, including the ER-diagram for the MySQL relational database and screenshots of the Neo4j structures
│   ├── TCGA_AML_db_ERD.png
│   ├── Neo4j_overview.png
│   └── neo4j_SNP.png
│
├── docs/ ## Full project documentation
│   └── TCGA_AML_database_documentation.pdf
│
├── neo4j/ ## Everything needed to build the Neo4j graph database
│   ├── datasets/
│   │   ├── SNPs_patients_genes.csv
│   │   └── dbsnp_annotations.cypher
│   │
│   ├── scripts/
│   │   ├── SQL_extract.txt
│   │   └── generate_neo4j_cypher.py
│   │
│   └── cypher_commands/
│       ├── neo4j_import.cypher
│       └── neo4j_chemistry.cypher
│
├── scripts/ ## Python scripts used to clean and prepare the raw data
│   └── data_cleaning/
│       ├── Find_mutationrsem_mismatches.py
│       ├── Remove_mutationrsem_mismatches.py
│       ├── Hugo_symbol_fixation.py
│       └── patient_data_cleaning.py
│
└── sql/ ## SQL commands that define the MySQL relational database
    ├── DDL_TCGA_AML_db.txt
    │
    └── DML_commands/
        ├── SQL_insert_allele.txt
        ├── SQL_insert_cancer_sample.txt
        ├── SQL_insert_cancer_type.txt
        ├── SQL_insert_consequence.txt
        ├── SQL_insert_experiment.txt
        ├── SQL_insert_gene.txt
        ├── SQL_insert_gene_expression.sql (excluded, see note below)
        ├── SQL_insert_mutation.txt
        ├── SQL_insert_patient.txt
        ├── SQL_insert_patient_condition.txt
        ├── SQL_insert_survival_record.txt
        ├── SQL_insert_transcript.txt
        └── SQL_insert_treatment.txt
```

## MySQL Relational Database Recreation Instructions
### Method 1 — Reconstruct Database from DDL and DML Scripts
1. Create the database in phpMyAdmin using SQL script: 
   ```
   CREATE DATABASE TCGA_AML_db;
   ```
2. Run the schema script: 
   ```
   sql/DDL_TCGA_AML_db.txt
   ```
3. Load tables **without** foreign keys first, in the following order:
   - SQL_insert_patient.txt
   - SQL_insert_transcript.txt
   - SQL_insert_consequence.txt
   - SQL_insert_allele.txt
   - SQL_insert_treatment.txt
   - SQL_insert_experiment.txt
   - SQL_insert_survival_record.txt

4. Load tables **with** foreign keys next, in the following order:
   - SQL_insert_gene.txt
   - SQL_insert_patient_condition.txt
   - SQL_insert_cancer_sample.txt
   - SQL_insert_cancer_type.txt
   - SQL_insert_gene_expression.sql *(see note below)*
   - SQL_insert_mutation.txt
     
All DML scripts are located in `sql/TCGA_AML_db_DML_commands/`.
> **Note:** `SQL_insert_gene_expression.sql` is excluded from this repository due to GitHub's 100MB file size limit. The gene expression data can be regenerated from the raw TCGA RSEM file in `data/TCGA_AML_db raw data/data_mrna_seq_v2_rsem.txt` using the cleaning scripts.
### Method 2 — Restore Full Database from Compressed SQL Export
The entire MySQL relational database can also be reconstructed directly from the compressed SQL export: TCGA_AML_db.sql.gz
1. First, decompress the file:
   ```
   gunzip TCGA_AML_db.sql.gz
   ```
2. Then load the SQL code in phpMyAdmin
    ```
   SOURCE TCGA_AML_db.sql;
   ```
    
## Neo4j Graph Database Recreation Instructions
### Method 1 — Reconstruct Neo4j Database from Cypher Scripts
Run the Cypher scripts in the Neo4j browser following this order:
1. `neo4j/cypher_commands/neo4j_import.cypher` — creates nodes and relationships
2. `neo4j/cypher_commands/neo4j_chemistry.cypher` — adds amino acid biochemical properties
3. `neo4j/Neo4j datasets/generate_neo4j_cypher.py` — import the pre-fetched annotations
### Method 2 - Restore Full Neo4j Graph Database from Dump File
The complete Neo4j graph database can also be restored directly from the compressed Neo4j dump file: TCGA_AML_neo4j.dump.gz
1. First, decompress the file:
   ```
   gunzip TCGA_AML_neo4j.dump.gz
   ```
2. Stop the Neo4j database before restoration:
   ```
   neo4j stop
   ```
3. Restore the Neo4j database using:
   ```
   neo4j-admin database load neo4j --from-path=. --overwrite-destination=true
   ```
4. Restart Neo4j:
    ```
   neo4j start
   ```
    
## Documentation and Diagrams 
- Full project write-up: `docs/TCGA AML database documentation.pdf`
- Full Entity-relationship diagram: `diagrams/TCGA_AML_db_ERD.png`
- Neo4j graph overview: `diagrams/Neo4j_overview.png`

## Limitations
1. Copy number alteration (CNA), DNA methylation, and RPKM RNA-seq data were excluded
2. The gene expression SQL insert file exceeds GitHub's 100MB file size limit and must be regenerated locally
3. The virtual machine environment used to construct and host the database cannot be provided due to authorization and licensing restrictions
4. SQL scripts were stored in .txt format instead of standard .sql files
