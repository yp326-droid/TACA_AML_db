# TACA_AML_db
A relational database for Acute Myeloid Leukemia (AML) data from The Cancer Genome Atlas (TCGA) Firehose Legacy pipeline. 

# Project Summary
A relational (MySQL) and graph (Neo4j) database for Acute Myeloid Leukemia (AML) data from The Cancer Genome Atlas (TCGA) Firehose Legacy pipeline. The database integrates patient demographics, clinical records, mutation profiles, and RSEM gene expression data from 200 AML patients, enabling analysis of SNP-gene-expression relationships and gaining biological insights.

## Tools and Technologies
- **DBMS:** MySQL 9.5.0, Neo4j
- **Administration:** phpMyAdmin 5.2.3
- **Programming:** Python 3, SQL, Cypher
- **Environment:** Oracle VM VirtualBox, Linux Fedora

## Repository Structure
│   TCGA_AML_db
|   .gitignore
│   [README.md](http://README.md)
│
├───data
│   ├───TCGA_AML_db cleaned data
│   │       data_clinical_patient.csv
│   │       data_clinical_sample.csv
│   │       data_mrna_seq_v2_rsem_mismatch_removed.csv
│   │       data_mutations_mismatch_removed.csv
│   │
│   └───TCGA_AML_db raw data
│           data_clinical_patient.txt
│           data_clinical_sample.txt
│           data_cna.txt
│           data_cna_hg19.seg
│           data_gistic_genes_amp.txt
│           data_gistic_genes_del.txt
│           data_linear_cna.txt
│           data_methylation_hm27.txt
│           data_methylation_hm450.txt
│           data_mrna_seq_rpkm.txt
│           data_mrna_seq_rpkm_zscores_ref_all_samples.txt
│           data_mrna_seq_rpkm_zscores_ref_diploid_samples.txt
│           data_mrna_seq_v2_rsem.txt
│           data_mrna_seq_v2_rsem_zscores_ref_all_samples.txt
│           data_mrna_seq_v2_rsem_zscores_ref_diploid_samples.txt
│           data_mutations.txt
│           LICENSE
│           meta_clinical_patient.txt
│           meta_clinical_sample.txt
│           meta_cna.txt
│           meta_cna_hg19_seg.txt
│           meta_gistic_genes_amp.txt
│           meta_gistic_genes_del.txt
│           meta_linear_cna.txt
│           meta_methylation_hm27.txt
│           meta_methylation_hm450.txt
│           meta_mrna_seq_rpkm.txt
│           meta_mrna_seq_rpkm_zscores_ref_all_samples.txt
│           meta_mrna_seq_rpkm_zscores_ref_diploid_samples.txt
│           meta_mrna_seq_v2_rsem.txt
│           meta_mrna_seq_v2_rsem_zscores_ref_all_samples.txt
│           meta_mrna_seq_v2_rsem_zscores_ref_diploid_samples.txt
│           meta_mutations.txt
│           meta_study.txt
│           README.txt
│
├───diagrams
│       Neo4j_overview.png
│       neo4j_SNP.png
│       TCGA_AML_db_ERD.png
│
├───docs
│       TCGA AML database documentation.pdf
│
├───neo4j
│   ├───Neo4j datasets
│   │       dbsnp_annotations.cypher
│   │       SNPs_patients_genes.csv
│   │
│   └───Neo4j scripts
│       │   generate_neo4j_[cypher.py](http://cypher.py)
│       │   SQL_extract.txt
│       │
│       └───Neo4j cypher commands
│               neo4j_chemistry.cypher
│               neo4j_import.cypher
│
├───scripts
│   └───TCGA_AML_db data cleaning codes
│           Find_mutationrsem_[mismatches.py](http://mismatches.py)
│           Hugo_symbol_[fixation.py](http://fixation.py)
│           patient_data_[cleaning.py](http://cleaning.py)
│           Remove_mutationrsem_[mismatches.py](http://mismatches.py)
│
└───sql
    │   DDL_TCGA_AML_db.txt
    │
    └───TCGA_AML_db_DML_commands
            SQL_insert_allele.txt
            SQL_insert_cancer_sample.txt
            SQL_insert_cancer_type.txt
            SQL_insert_consequence.txt
            SQL_insert_experiment.txt
            SQL_insert_gene.txt
            SQL_insert_gene_expression.sql
            SQL_insert_mutation.txt
            SQL_insert_patient.txt
            SQL_insert_patient_condition.txt
            SQL_insert_survival_record.txt
            SQL_insert_transcript.txt
            SQL_insert_treatment.txt

## MySQL Recreation Instructions
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

## Neo4j Graph Database Recreation Instructions
Run the Cypher scripts in `neo4j/Neo4j scripts/Neo4j cypher commands/` in Neo4j browser following this order:
   - `neo4j_import.cypher` — creates nodes and relationships
   - `neo4j_chemistry.cypher` — adds amino acid biochemical properties
   - `neo4j/Neo4j datasets/generate_neo4j_cypher.py` — import the pre-fetched annotations

## Documentation and Diagrams 
Full project write-up: `docs/TCGA AML database documentation.pdf`
Full Entity-relationship diagram: `diagrams/TCGA_AML_db_ERD.png`
Neo4j graph overview: `diagrams/Neo4j_overview.png`

## Limitations
1. Copy number alteration (CNA), DNA methylation, and RPKM RNA-seq data were excluded
2. The gene expression SQL insert file exceeds GitHub's 100MB file size limit and must be regenerated locally
