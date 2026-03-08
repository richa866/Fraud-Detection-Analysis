# Credit Card Fraud Detection — Pattern Analysis

> Can we identify fraud without machine learning?

A complete data analysis project investigating statistical patterns 
in 284,807 real credit card transactions — using pure SQL analysis, 
Python visualisation, and a rule-based flag system.

---

## Project Summary

The dataset contains 492 confirmed fraud cases out of 284,807 transactions 
a fraud rate of just 0.17%. The challenge is finding signals strong enough 
to rise above that noise without building a machine learning model.

**Result:** A three-rule flag system that achieves 40% precision at Score 2 
237x more precise than random chance — built entirely from patterns 
discovered in the analysis.

---

## Tools Used

| Tool | Purpose |
|------|---------|
| MySQL | Data storage + SQL analysis (7 queries) |
| Python | Data loading + chart generation |
| Pandas | Data manipulation |
| Matplotlib | Visualisations |
| Scipy | Statistical analysis (Z-scores) |

---

## Repository Structure
```
fraud-detection-analysis/
│
├── data/                        ← CSV not included (143MB)
├── SQL/                         ← All 7 SQL queries
├── sql_results/                 ← Query outputs as CSVs
├── chartAnalysis.ipynb      ← Full analysis notebook
├── charts/                     ← All charts as PNG files
└── README.md
```

---

## Key Findings

**Finding 1 — Severe Class Imbalance**
Only 0.17% of transactions are fraud. Accuracy is a completely 
misleading metric everything is measured against this baseline.

**Finding 2 — Fraud Peaks at Night**
Hour 2 has a 1.71% fraud rate — 10x the baseline. Hour 4 is a 
hidden danger ranked #6 by volume but #2 by rate at 1.04%.

**Finding 3 — Two Distinct Fraud Strategies**
Large transactions ($1000+) → 0.29% fraud rate → high-value card abuse.
Micro transactions (under $10) → 0.26% fraud rate → automated card testing.

**Finding 4 — Duplicate Transactions Signal Bots**
All top 15 duplicate transaction groups contained confirmed fraud.
Repeated $1.00 charges in the same minute = stolen card verification.

**Finding 5 — V17 is the Strongest Fraud Signal**
Of all 28 anonymised features, V17 has the highest correlation 
with fraud at 0.33. Transaction amount does not appear in the top 15.

---

## Flag System

Three rules derived directly from the analysis above:

| Flag | Rule | Based On |
|------|------|---------|
| Flag 1 | Amount Z-score > 3 | Finding 3 — anomalous amounts |
| Flag 2 | Transaction at Hour 2 or Hour 4 | Finding 2 — peak fraud hours |
| Flag 3 | V17 below 1st percentile | Finding 5 — strongest feature signal |

**Performance:**

| Risk Score | Transactions | Fraud Rate |
|------------|-------------|------------|
| 0 — No flags | 269,083 | 0.02% |
| 1 — One flag | 15,495 | 2.14% |
| 2 — Two flags | 228 | 40.35% |
| 3 — All flags | 1 | 100.00% |

At Score 2 the system is **237x more precise** than the 0.17% baseline.

---

## Dataset

Kaggle — Credit Card Fraud Detection by ULB Machine Learning Group  
284,807 transactions | 492 fraud cases | 48 hours of data  
Features V1-V28 are PCA-transformed to protect cardholder privacy.  
CSV not included in repository due to file size (143MB).  
Download from: https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud

---

*Analysis by Richa | Python | MySQL | Pandas | Matplotlib | Scipy*
```
