import numpy as np
import pandas as pd
from pathlib import Path
from sklearn.metrics import mutual_info_score
from scipy.stats import chi2_contingency
import matplotlib.pyplot as plt
import time

# Configuration
np.random.seed(1)
DATA_DIR = Path("/Users/sam/Documents/Classes/CSDS 313/HW/HW3/dataset")     # change directory here
P1A_FILE = DATA_DIR / "p1a.csv"
P1B_FILE = DATA_DIR / "p1b.csv"

# Helper functions
def jaccard_index(x, y):
    """Binary Jaccard index."""
    x = np.asarray(x).astype(int)
    y = np.asarray(y).astype(int)
    inter = np.logical_and(x == 1, y == 1).sum()
    union = np.logical_or(x == 1, y == 1).sum()
    return inter / union if union > 0 else 0.0

def mutual_information(x, y):
    return mutual_info_score(x, y)

def chi2_stat_and_p(x, y):
    table = pd.crosstab(x, y)
    chi2_stat, p, dof, expected = chi2_contingency(table, correction=False)
    return chi2_stat, p

def permutation_p_value(obs_stat, stat_func, a, b, N=500, higher_is_more_extreme=True):
    """Permutation test: permute both columns independently."""
    count = 0
    for i in range(N):
        sa = np.random.permutation(a)
        sb = np.random.permutation(b)
        stat = stat_func(sa, sb)
        if higher_is_more_extreme and stat >= obs_stat:
            count += 1
        elif not higher_is_more_extreme and stat <= obs_stat:
            count += 1
    return (count + 1) / (N + 1)

def benjamini_hochberg(pvals, alpha=0.05):
    """Return rejection mask and critical p-value."""
    pvals = np.asarray(pvals)
    m = len(pvals)
    order = np.argsort(pvals)
    sorted_p = pvals[order]
    thresholds = (np.arange(1, m + 1) / m) * alpha
    below = sorted_p <= thresholds
    if not np.any(below):
        return np.zeros(m, dtype=bool), None
    max_idx = np.where(below)[0].max()
    crit_p = sorted_p[max_idx]
    rejected = pvals <= crit_p
    return rejected, crit_p

# Load data
p1a = pd.read_csv(P1A_FILE, header=None)
p1b = pd.read_csv(P1B_FILE, header=None)
print(f"Loaded p1a {p1a.shape}, p1b {p1b.shape}")

# Part 1a
a = p1a.iloc[:, 0].values
b = p1a.iloc[:, 1].values
mi_obs = mutual_information(a, b)
ji_obs = jaccard_index(a, b)
chi2_obs, chi2_p = chi2_stat_and_p(a, b)

p1a_N = 5000
t0 = time.time()
mi_pval = permutation_p_value(mi_obs, mutual_information, a, b, N=p1a_N)
ji_pval = permutation_p_value(ji_obs, jaccard_index, a, b, N=p1a_N)
t1 = time.time()

p1a_results = pd.DataFrame({
    "statistic": ["Mutual Information", "Jaccard Index", "Pearson_chi2"],
    "value": [mi_obs, ji_obs, chi2_obs],
    "p_value": [mi_pval, ji_pval, chi2_p],
    "p_method": ["permutation", "permutation", "chi2_parametric"],
    "N_perm": [p1a_N, p1a_N, None]
})
p1a_results.to_csv(DATA_DIR / "p1a_results.csv", index=False)
print("\n--- p1a results ---")
print(p1a_results)

# Part 1b
n_cols_b = p1b.shape[1]
pairs = [(i, j) for i in range(n_cols_b) for j in range(i + 1, n_cols_b)]
p1b_N = 500

records = []
tstart = time.time()
for (i, j) in pairs:
    ai = p1b.iloc[:, i].values
    bj = p1b.iloc[:, j].values
    mi_val = mutual_information(ai, bj)
    ji_val = jaccard_index(ai, bj)
    chi2_val, chi2_pval = chi2_stat_and_p(ai, bj)
    mi_p = permutation_p_value(mi_val, mutual_information, ai, bj, N=p1b_N)
    ji_p = permutation_p_value(ji_val, jaccard_index, ai, bj, N=p1b_N)
    records.append({
        "i": i, "j": j,
        "MI": mi_val, "MI_p": mi_p,
        "JI": ji_val, "JI_p": ji_p,
        "chi2": chi2_val, "chi2_p": chi2_pval
    })
tend = time.time()

results_df = pd.DataFrame.from_records(records)
results_df.to_csv(DATA_DIR / "p1b_pairwise_results_raw.csv", index=False)

# Benjamini–Hochberg FDR
alpha = 0.05
results_df["MI_reject"], _ = benjamini_hochberg(results_df["MI_p"].values, alpha)
results_df["JI_reject"], _ = benjamini_hochberg(results_df["JI_p"].values, alpha)
results_df["chi2_reject"], _ = benjamini_hochberg(results_df["chi2_p"].values, alpha)
results_df.to_csv(DATA_DIR / "p1b_pairwise_results_withBH.csv", index=False)

# Summaries and overlaps
mi_sig = results_df["MI_reject"].sum()
ji_sig = results_df["JI_reject"].sum()
chi2_sig = results_df["chi2_reject"].sum()
mi_ji_overlap = ((results_df["MI_reject"]) & (results_df["JI_reject"])).sum()
mi_chi_overlap = ((results_df["MI_reject"]) & (results_df["chi2_reject"])).sum()
ji_chi_overlap = ((results_df["JI_reject"]) & (results_df["chi2_reject"])).sum()
all_three = ((results_df["MI_reject"]) &
             (results_df["JI_reject"]) &
             (results_df["chi2_reject"])).sum()

summary = pd.DataFrame({
    "stat": ["MI", "JI", "chi2"],
    "n_significant": [mi_sig, ji_sig, chi2_sig]
})
overlap_df = pd.DataFrame({
    "pair": ["MI & JI", "MI & chi2", "JI & chi2", "MI & JI & chi2"],
    "count": [mi_ji_overlap, mi_chi_overlap, ji_chi_overlap, all_three]
})
summary.to_csv(DATA_DIR / "p1b_summary_counts.csv", index=False)
overlap_df.to_csv(DATA_DIR / "p1b_overlaps.csv", index=False)

print("\n--- p1b significant counts ---")
print(summary)
print("\n--- Overlaps ---")
print(overlap_df)

# Plots
plt.figure()
plt.scatter(results_df["MI"], results_df["JI"])
plt.xlabel("Mutual Information")
plt.ylabel("Jaccard Index")
plt.title("MI vs JI (p1b pairs)")
plt.tight_layout()
plt.savefig(DATA_DIR / "p1b_MI_vs_JI.png")

plt.figure()
plt.scatter(results_df["MI"], results_df["chi2"])
plt.xlabel("Mutual Information")
plt.ylabel("Chi2 statistic")
plt.title("MI vs Chi2 (p1b pairs)")
plt.tight_layout()
plt.savefig(DATA_DIR / "p1b_MI_vs_chi2.png")

plt.figure()
plt.scatter(results_df["JI"], results_df["chi2"])
plt.xlabel("Jaccard Index")
plt.ylabel("Chi2 statistic")
plt.title("JI vs Chi2 (p1b pairs)")
plt.tight_layout()
plt.savefig(DATA_DIR / "p1b_JI_vs_chi2.png")

# part 1
# put the p1a result printed as a table here

# MI and χ² both reject the null of independence at α = 0.05 (p < 0.01).
# JI = 0 means both columns almost never share 1’s simultaneously; the dependence found by MI/χ² must therefore involve other value patterns (i.e, non-co-occurrence of ones, or correlation of zeros).
# Conclusion: the two binary variables in p1a are dependent, but not through shared “1” events.

# part 2
# put the p1b result printed as a table here

# 1. High agreement between MI and χ² (91 overlap of 93 χ² rejections):
# MI and χ² are both sensitive to any dependence between two categorical variables, not just co-occurrence of 1’s.
# They generally pick up the same signals of association.

# 2. Jaccard Index much more conservative (56 pairs):
# JI measures co-occurrence of 1’s only.
# It ignores mutual absence and other forms of dependence, so it finds fewer associations.
# Almost every JI-significant pair (55/56) is also MI- and χ²-significant, showing that when there is strong co-occurrence, all three metrics agree.

# 3. Patterns in overlaps:
# The 55 triply-significant pairs correspond to genuinely strong “co-activation” relationships (both 1s appear together often).
# The additional 36–38 pairs that are MI/χ²-only likely represent inverse or asymmetric dependencies (e.g., one variable tends to be 0 when the other is 1).

# 4. FDR correction effect:
# Even after multiple-testing adjustment (105 pairs), most associations remain significant → the dataset contains substantial inter-variable dependence.

# Extra
# visualization analysis:
# MI vs χ²: a nearly linear positive relationship (both increase with strength of dependence).
# JI vs MI/χ²: points cluster near 0 for weak pairs, and a small subset with high JI correspond to the 55 triply significant pairs.