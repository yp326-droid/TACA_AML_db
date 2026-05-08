import pandas as pd

# Load data
df = pd.read_csv("data_clinical_patient.csv")

# Columns to KEEP
columns_to_keep = [
    "other_patient_id",
    "bcr_patient_barcode",
    "gender",
    "race",
    "ethnicity",
    "history_other_malignancy",
    "history_neoadjuvant_treatment",
    "initial_pathologic_dx_year",
    "age_at_initial_pathologic_diagnosis",
    "fab_morphology",
    "platelet_count_preresection",
    "blast_count",
    "basophils_count",
    "abnormal_lymphocyte_percent",
    "cytogenetic_abnormality_type",
    "atra_exposure",
    "tissue_source_site",
    "site_of_tumor_tissue",
    "os_status",
    "os_months"
]

# Keep only existing columns (important!)
columns_to_keep = [col for col in columns_to_keep if col in df.columns]

# Filter dataset
df_clean = df[columns_to_keep]

# Save cleaned file
df_clean.to_csv("clinical_patient_cleaned.csv", index=False)

print("Original columns:", len(df.columns))
print("Remaining columns:", len(df_clean.columns))