// =============================================
// dbSNP Clinical Annotations for SNP nodes
// =============================================

// rs104886029
MATCH (s:SNP {dbsnp_rs: "rs104886029"})
SET s.clinical_significance = "not-provided",
    s.associated_diseases = "Familial cancer of breast";

// rs112445441
MATCH (s:SNP {dbsnp_rs: "rs112445441"})
SET s.clinical_significance = "pathogenic; likely-pathogenic; uncertain-significance; not-provided",
    s.associated_diseases = "Non-small cell lung carcinoma; Thyroid tumor; Neoplasm of the large intestine; not provided; Breast adenocarcinoma";

// rs113581628
MATCH (s:SNP {dbsnp_rs: "rs113581628"})
SET s.clinical_significance = "Not reported",
    s.associated_diseases = "Not reported";

// rs11554290
MATCH (s:SNP {dbsnp_rs: "rs11554290"})
SET s.clinical_significance = "likely-pathogenic; pathogenic; uncertain-significance",
    s.associated_diseases = "Malignant neoplasm of body of uterus; Neoplasm of the large intestine; Glioblastoma; Hepatocellular carcinoma; Acute myeloid leukemia";

// rs121434596
MATCH (s:SNP {dbsnp_rs: "rs121434596"})
SET s.clinical_significance = "likely-pathogenic; pathogenic",
    s.associated_diseases = "Neoplasm; Melanoma; Multiple myeloma; Malignant melanoma of skin; Medulloblastoma";

// rs121907900
MATCH (s:SNP {dbsnp_rs: "rs121907900"})
SET s.clinical_significance = "pathogenic; likely-pathogenic",
    s.associated_diseases = "Drash syndrome; Meacham syndrome; Nephrotic syndrome, type 4; 11p partial monosomy syndrome; Frasier syndrome";

// rs121912880
MATCH (s:SNP {dbsnp_rs: "rs121912880"})
SET s.clinical_significance = "pathogenic",
    s.associated_diseases = "not provided; Spondyloepimetaphyseal dysplasia, Strudwick type; Inborn genetic diseases; Spondyloperipheral dysplasia";

// rs121913237
MATCH (s:SNP {dbsnp_rs: "rs121913237"})
SET s.clinical_significance = "pathogenic; likely-pathogenic; pathogenic-likely-pathogenic",
    s.associated_diseases = "Noonan syndrome; not provided; Melanoma; Multiple myeloma; Gastric adenocarcinoma";

// rs121913250
MATCH (s:SNP {dbsnp_rs: "rs121913250"})
SET s.clinical_significance = "pathogenic; likely-pathogenic",
    s.associated_diseases = "not provided; Malignant neoplasm of body of uterus; Neoplasm of the large intestine; Multiple myeloma; Gastric adenocarcinoma";

// rs121913254
MATCH (s:SNP {dbsnp_rs: "rs121913254"})
SET s.clinical_significance = "likely-pathogenic; pathogenic; not-provided; drug-response; uncertain-significance",
    s.associated_diseases = "Melanoma; Large congenital melanocytic nevus; Neurocutaneous melanocytosis; B-cell chronic lymphocytic leukemia; Acute myeloid leukemia";

// rs121913255
MATCH (s:SNP {dbsnp_rs: "rs121913255"})
SET s.clinical_significance = "pathogenic; likely-pathogenic; uncertain-significance",
    s.associated_diseases = "not provided; Glioblastoma; Acute myeloid leukemia; Hepatocellular carcinoma; Thyroid tumor";

// rs121913343
MATCH (s:SNP {dbsnp_rs: "rs121913343"})
SET s.clinical_significance = "pathogenic-likely-pathogenic; uncertain-significance; pathogenic; not-provided; likely-pathogenic",
    s.associated_diseases = "Hereditary cancer-predisposing syndrome; Li-Fraumeni syndrome 1; Malignant tumor of prostate; Li-Fraumeni syndrome; not provided";

// rs121913499
MATCH (s:SNP {dbsnp_rs: "rs121913499"})
SET s.clinical_significance = "likely-pathogenic; pathogenic; pathogenic-likely-pathogenic",
    s.associated_diseases = "Neoplasm of brain; Lung adenocarcinoma; Breast neoplasm; Astrocytoma; Hepatocellular carcinoma";

// rs121913500
MATCH (s:SNP {dbsnp_rs: "rs121913500"})
SET s.clinical_significance = "likely-pathogenic; pathogenic; not-provided; pathogenic-likely-pathogenic",
    s.associated_diseases = "Myelodysplastic syndrome; Neoplasm of the large intestine; Acute myeloid leukemia; Transitional cell carcinoma of the bladder; Medulloblastoma";

// rs121913506
MATCH (s:SNP {dbsnp_rs: "rs121913506"})
SET s.clinical_significance = "uncertain-significance; pathogenic; likely-pathogenic; other",
    s.associated_diseases = "Gastrointestinal stromal tumor; Germ cell tumor of testis; not provided; Hematologic neoplasm; Melanoma";

// rs121913507
MATCH (s:SNP {dbsnp_rs: "rs121913507"})
SET s.clinical_significance = "uncertain-significance; likely-pathogenic; pathogenic; other; conflicting-interpretations-of-pathogenicity",
    s.associated_diseases = "Gastrointestinal stromal tumor; Mast cell leukemia; Hematologic neoplasm; Acute myeloid leukemia; Dysgerminoma";

// rs121913527
MATCH (s:SNP {dbsnp_rs: "rs121913527"})
SET s.clinical_significance = "likely-pathogenic; uncertain-significance; pathogenic; conflicting-interpretations-of-pathogenicity; not-provided",
    s.associated_diseases = "RASopathy; not provided; Neoplasm of the large intestine; Multiple myeloma; Autoimmune lymphoproliferative syndrome type 4";

// rs121913529
MATCH (s:SNP {dbsnp_rs: "rs121913529"})
SET s.clinical_significance = "pathogenic; likely-pathogenic; not-provided; pathogenic-likely-pathogenic; association",
    s.associated_diseases = "Carcinoma of pancreas; Nevus sebaceous; Juvenile myelomonocytic leukemia; Non-small cell lung carcinoma; not provided";

// rs121918454
MATCH (s:SNP {dbsnp_rs: "rs121918454"})
SET s.clinical_significance = "likely-pathogenic; pathogenic-likely-pathogenic; pathogenic; conflicting-interpretations-of-pathogenicity",
    s.associated_diseases = "Acute myeloid leukemia; B-cell chronic lymphocytic leukemia; Neoplasm of brain; Neuroblastoma; Noonan syndrome 1";

// rs121918458
MATCH (s:SNP {dbsnp_rs: "rs121918458"})
SET s.clinical_significance = "pathogenic",
    s.associated_diseases = "Noonan syndrome 1; Juvenile myelomonocytic leukemia; Noonan syndrome; not provided; RASopathy";

// rs121918470
MATCH (s:SNP {dbsnp_rs: "rs121918470"})
SET s.clinical_significance = "pathogenic; pathogenic-likely-pathogenic; likely-pathogenic",
    s.associated_diseases = "LEOPARD syndrome 1; RASopathy; not provided; Noonan syndrome with multiple lentigines; Noonan syndrome 3";

// rs121918697
MATCH (s:SNP {dbsnp_rs: "rs121918697"})
SET s.clinical_significance = "pathogenic",
    s.associated_diseases = "Thyroid hormone resistance, generalized, autosomal dominant; Selective pituitary resistance to thyroid hormone; not provided";

// rs137853227
MATCH (s:SNP {dbsnp_rs: "rs137853227"})
SET s.clinical_significance = "pathogenic",
    s.associated_diseases = "Adrenocortical tumor, somatic; Ovarian granulosa cell tumor; Thecoma, somatic";

// rs137854556
MATCH (s:SNP {dbsnp_rs: "rs137854556"})
SET s.clinical_significance = "pathogenic; likely-pathogenic",
    s.associated_diseases = "not provided; Neurofibromatosis, type 1; Café-au-lait macules with pulmonary stenosis; Juvenile myelomonocytic leukemia; Neurofibromatosis, familial spinal";

// rs17851045
MATCH (s:SNP {dbsnp_rs: "rs17851045"})
SET s.clinical_significance = "pathogenic; likely-pathogenic; uncertain-significance",
    s.associated_diseases = "Non-small cell lung carcinoma; Neoplasm of the large intestine; Lung adenocarcinoma; Malignant melanoma of skin; Squamous cell lung carcinoma";

// rs181856403
MATCH (s:SNP {dbsnp_rs: "rs181856403"})
SET s.clinical_significance = "Not reported",
    s.associated_diseases = "Not reported";

// rs33981747
MATCH (s:SNP {dbsnp_rs: "rs33981747"})
SET s.clinical_significance = "Not reported",
    s.associated_diseases = "Not reported";

// rs34051457
MATCH (s:SNP {dbsnp_rs: "rs34051457"})
SET s.clinical_significance = "Not reported",
    s.associated_diseases = "Not reported";

// rs55863639
MATCH (s:SNP {dbsnp_rs: "rs55863639"})
SET s.clinical_significance = "pathogenic; not-provided; likely-pathogenic; pathogenic-likely-pathogenic",
    s.associated_diseases = "Li-Fraumeni syndrome; not provided; Hereditary cancer-predisposing syndrome; Li-Fraumeni syndrome 1; TP53-related disorder";

// rs56185003
MATCH (s:SNP {dbsnp_rs: "rs56185003"})
SET s.clinical_significance = "Not reported",
    s.associated_diseases = "Not reported";

// rs61112029
MATCH (s:SNP {dbsnp_rs: "rs61112029"})
SET s.clinical_significance = "Not reported",
    s.associated_diseases = "Not reported";

// rs61397759
MATCH (s:SNP {dbsnp_rs: "rs61397759"})
SET s.clinical_significance = "Not reported",
    s.associated_diseases = "Not reported";

// rs71818662
MATCH (s:SNP {dbsnp_rs: "rs71818662"})
SET s.clinical_significance = "Not reported",
    s.associated_diseases = "Not reported";

// rs71889021
MATCH (s:SNP {dbsnp_rs: "rs71889021"})
SET s.clinical_significance = "Not reported",
    s.associated_diseases = "Not reported";

// rs74315450
MATCH (s:SNP {dbsnp_rs: "rs74315450"})
SET s.clinical_significance = "pathogenic",
    s.associated_diseases = "Hereditary thrombocytopenia and hematological cancer predisposition syndrome associated with RUNX1; not provided";

// rs77375493
MATCH (s:SNP {dbsnp_rs: "rs77375493"})
SET s.clinical_significance = "pathogenic; conflicting-interpretations-of-pathogenicity; pathogenic-likely-pathogenic; risk-factor; likely-pathogenic; affects; not-provided",
    s.associated_diseases = "Thrombocythemia 3; Acquired polycythemia vera; Primary myelofibrosis; Acute myeloid leukemia; Budd-Chiari syndrome, susceptibility to, somatic";

// rs80338758
MATCH (s:SNP {dbsnp_rs: "rs80338758"})
SET s.clinical_significance = "pathogenic; likely-pathogenic",
    s.associated_diseases = "FG syndrome 1; Abnormal facial shape; Broad thumb; Corpus callosum, agenesis of; Global developmental delay";
