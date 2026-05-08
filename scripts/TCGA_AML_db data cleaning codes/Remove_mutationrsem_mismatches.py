import pandas as pd

# -----------------------------
# 1. Load files
# -----------------------------
mut_df = pd.read_csv("data_mutations.csv")
rsem_df = pd.read_csv("data_mrna_seq_v2_rsem.csv")

# -----------------------------
# 2. Clean Entrez Gene IDs
# -----------------------------
mut_df["Entrez_Gene_Id_clean"] = pd.to_numeric(mut_df["Entrez_Gene_Id"], errors="coerce")
rsem_df["Entrez_Gene_Id_clean"] = pd.to_numeric(rsem_df["Entrez_Gene_Id"], errors="coerce")

# -----------------------------
# 3. Mismatch Entrez ID list
# -----------------------------
mismatch_ids = [
    1817, 3502, 28223, 28791, 28795, 54777, 79516, 84443, 85317, 85446,
    121296, 127608, 144535, 152845, 161271, 200493, 253650, 257039, 283755,
    285311, 343578, 344760, 353335, 387761, 387770, 387820, 388276, 390904,
    392008, 400879, 400950, 401218, 401875, 406934, 440181, 441644, 574490,
    642131, 642635, 642943, 643342, 643535, 643962, 644456, 644504, 644992,
    645181, 645834, 645949, 645954, 646513, 647211, 648927, 653441, 653657,
    677768, 692084, 727878, 727895, 728138, 728205, 728211, 728896, 729217,
    730167, 780851, 100126341, 100128322, 100128340, 100128744, 100128989,
    100129876, 100130041, 100130134, 100130734, 100131253, 100131447,
    100131482, 100131699, 100132713, 100132903, 100133292, 100133655,
    100133718, 100158258, 100189497, 100289574, 100289678, 100302286,
    100419824, 100463285, 100499483, 100506190
]

mismatch_ids = set(mismatch_ids)

# -----------------------------
# 4. Remove mismatches
# -----------------------------
mut_filtered = mut_df[~mut_df["Entrez_Gene_Id_clean"].isin(mismatch_ids)].copy()
rsem_filtered = rsem_df[~rsem_df["Entrez_Gene_Id_clean"].isin(mismatch_ids)].copy()

# -----------------------------
# 5. Drop helper column
# -----------------------------
mut_filtered = mut_filtered.drop(columns=["Entrez_Gene_Id_clean"])
rsem_filtered = rsem_filtered.drop(columns=["Entrez_Gene_Id_clean"])

# -----------------------------
# 6. Save files (UPDATED NAMES)
# -----------------------------
mut_filtered.to_csv("data_mutations_mismatch_removed.csv", index=False)
rsem_filtered.to_csv("data_mrna_seq_v2_rsem_mismatch_removed.csv", index=False)

# -----------------------------
# 7. Summary
# -----------------------------
print("===== MISMATCH REMOVAL SUMMARY =====")
print(f"Original mutation rows: {len(mut_df)}")
print(f"After removal: {len(mut_filtered)}")
print(f"Removed mutation rows: {len(mut_df) - len(mut_filtered)}")
print()
print(f"Original RSEM rows: {len(rsem_df)}")
print(f"After removal: {len(rsem_filtered)}")
print(f"Removed RSEM rows: {len(rsem_df) - len(rsem_filtered)}")
print()
print("Saved files:")
print("- data_mutations_mismatch_removed.csv")
print("- data_mrna_seq_v2_rsem_mismatch_removed.csv")