import pandas as pd
import re

# -----------------------------
# 1. Load file
# -----------------------------
df = pd.read_csv("data_mrna_seq_v2_rsem_mismatch_removed.csv")

# -----------------------------
# 2. Helper: identify blank values
# -----------------------------
blank_mask = df["Hugo_Symbol"].isna() | (df["Hugo_Symbol"].astype(str).str.strip() == "")

# -----------------------------
# 3. Helper: identify date-like values
# -----------------------------
def is_date_like_symbol(val):
    if pd.isna(val):
        return False

    text = str(val).strip()
    if text == "":
        return False

    # Exclude obvious non-dates that contain slash/dash but are valid symbols
    # Add more exclusions here if needed
    known_valid_patterns = [
        r"^[A-Za-z0-9]+/[A-Za-z0-9]+$",   # e.g. FCA/MR
        r"^[A-Za-z0-9\-]+AS\d*$",         # antisense-like names
        r"^[A-Za-z0-9\-]+IT\d*$",
        r"^[A-Za-z0-9\-]+DT\d*$"
    ]
    for pat in known_valid_patterns:
        if re.match(pat, text, flags=re.IGNORECASE):
            return False

    # First: strict numeric full-date formats like 3/1/2026 or 2026-03-01
    numeric_date_patterns = [
        r"^\d{1,2}/\d{1,2}/\d{2,4}$",
        r"^\d{1,2}-\d{1,2}-\d{2,4}$",
        r"^\d{4}-\d{1,2}-\d{1,2}$"
    ]
    if any(re.match(p, text) for p in numeric_date_patterns):
        return True

    # Second: try parsing common date-like strings
    try:
        parsed = pd.to_datetime(text, errors="raise")
        # Only treat it as a bad symbol if the original text clearly looks date-ish
        # This avoids turning normal gene symbols into false positives
        if any(ch in text for ch in ["/", "-"]) and any(char.isdigit() for char in text):
            return True
    except Exception:
        return False

    return False

date_mask = df["Hugo_Symbol"].apply(is_date_like_symbol)

# -----------------------------
# 4. Capture originals BEFORE replacement
# -----------------------------
original_date_like_values = (
    df.loc[date_mask, "Hugo_Symbol"]
    .dropna()
    .astype(str)
    .drop_duplicates()
    .sort_values()
)

original_blank_count = blank_mask.sum()
original_date_count = date_mask.sum()

# -----------------------------
# 5. Replace invalid symbols
# -----------------------------
invalid_mask = blank_mask | date_mask
df.loc[invalid_mask, "Hugo_Symbol"] = "N/A"

# -----------------------------
# 6. Save output
# -----------------------------
df.to_csv("data_mrna_seq_v2_rsem_mismatch_removed_fixed_hugo_symbols.csv", index=False)

# -----------------------------
# 7. Report what was found
# -----------------------------
print("===== ORIGINAL DATE-LIKE HUGO SYMBOLS DETECTED =====")
if len(original_date_like_values) == 0:
    print("None detected in this CSV file.")
else:
    print(original_date_like_values.to_string(index=False))

print("\n===== SUMMARY =====")
print(f"Blank symbols replaced: {original_blank_count}")
print(f"Date-like symbols replaced: {original_date_count}")
print(f"Total replaced: {invalid_mask.sum()}")
print("\nSaved file:")
print("- data_mrna_seq_v2_rsem_mismatch_removed_fixed_hugo_symbols.csv")