import pandas as pd

# Load files
mut_df = pd.read_csv("data_mutations.csv")
rsem_df = pd.read_csv("data_mrna_seq_v2_rsem.csv")

# -----------------------------
# 1. Clean Entrez Gene IDs
# -----------------------------
# Convert to numeric so values like strings, blanks, or weird formatting become consistent
mut_df["Entrez_Gene_Id_clean"] = pd.to_numeric(mut_df["Entrez_Gene_Id"], errors="coerce")
rsem_df["Entrez_Gene_Id_clean"] = pd.to_numeric(rsem_df["Entrez_Gene_Id"], errors="coerce")

# Drop missing Entrez IDs from the mutation file for matching
mut_nonmissing = mut_df[mut_df["Entrez_Gene_Id_clean"].notna()].copy()
mut_nonmissing["Entrez_Gene_Id_clean"] = mut_nonmissing["Entrez_Gene_Id_clean"].astype(int)

# Create a set of Entrez IDs from RSEM for fast lookup
rsem_entrez_ids = set(
    rsem_df["Entrez_Gene_Id_clean"].dropna().astype(int)
)

# -----------------------------
# 2. Find mismatched mutation rows
# -----------------------------
mismatch_rows = mut_nonmissing[
    ~mut_nonmissing["Entrez_Gene_Id_clean"].isin(rsem_entrez_ids)
].copy()

# -----------------------------
# 3. Create unique mismatch table
# -----------------------------
# This keeps one row per unique unmatched gene ID / symbol pair
mismatch_unique = (
    mismatch_rows[["Entrez_Gene_Id_clean", "Hugo_Symbol"]]
    .drop_duplicates()
    .sort_values(by=["Entrez_Gene_Id_clean", "Hugo_Symbol"])
    .reset_index(drop=True)
)

# -----------------------------
# 4. Print summary
# -----------------------------
total_mut_rows = len(mut_df)
mut_rows_with_entrez = len(mut_nonmissing)
matched_rows = mut_rows_with_entrez - len(mismatch_rows)
missing_entrez_rows = mut_df["Entrez_Gene_Id_clean"].isna().sum()

unique_mut_entrez = mut_nonmissing["Entrez_Gene_Id_clean"].nunique()
unique_matched_entrez = unique_mut_entrez - mismatch_unique["Entrez_Gene_Id_clean"].nunique()
unique_unmatched_entrez = mismatch_unique["Entrez_Gene_Id_clean"].nunique()

print("===== MATCH SUMMARY =====")
print(f"Total mutation rows: {total_mut_rows}")
print(f"Mutation rows with non-missing Entrez ID: {mut_rows_with_entrez}")
print(f"Matched mutation rows: {matched_rows}")
print(f"Unmatched mutation rows: {len(mismatch_rows)}")
print(f"Mutation rows with missing Entrez ID: {missing_entrez_rows}")
print()
print(f"Unique mutation Entrez IDs: {unique_mut_entrez}")
print(f"Unique matched Entrez IDs: {unique_matched_entrez}")
print(f"Unique unmatched Entrez IDs: {unique_unmatched_entrez}")

# -----------------------------
# 5. Display all mismatches
# -----------------------------
print("\n===== ALL UNIQUE MISMATCHES =====")
print(mismatch_unique.to_string(index=False))

# -----------------------------
# 6. Optional: save mismatches to CSV
# -----------------------------
mismatch_unique.to_csv("unmatched_entrez_ids.csv", index=False)
mismatch_rows.to_csv("unmatched_mutation_rows.csv", index=False)

print("\nSaved:")
print("- unmatched_entrez_ids.csv")
print("- unmatched_mutation_rows.csv")