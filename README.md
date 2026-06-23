# 📊 Customer Churn Analysis & Prediction

**Author:** Nagaswetha Kaikala  
**Tools:** Python · SQL · Pandas · Scikit-learn · Matplotlib · Seaborn  
**Complexity:** Multi-table dataset (3 related tables, 190K+ total rows)

---

## 🗂 Project Overview

End-to-end data project analyzing **5,000 customers, 177K transactions, and 8,887 support tickets** to:
1. Identify why customers churn
2. Build a machine learning model to predict churn (AUC-ROC: 0.90+)
3. Identify at-risk active customers before they leave
4. Recommend data-driven retention strategies

---

## 📁 Dataset (3 Related Tables)

| Table | Rows | Description |
|---|---|---|
| `customers.csv` | 5,000 | Demographics, plan, charges, satisfaction |
| `transactions.csv` | 177,106 | Payment history, late payments, revenue |
| `support_tickets.csv` | 8,887 | Issue types, resolution time, escalations |

---

## 🔍 Key Findings

| Finding | Detail |
|---|---|
| 📉 Overall churn rate | ~20% of customers |
| 🆕 New customer risk | Tenure < 12 months = 2–3x higher churn |
| 📞 Support call signal | Each additional call raises churn probability significantly |
| ⭐ Strongest predictor | Satisfaction score (churned avg: 5.0 vs retained: 8.0) |
| 💳 Late payment link | Churned customers have 2–3x more late payments |
| 💡 Basic plan issue | Basic plan has highest churn rate |

---

## 🤖 Machine Learning Models

| Model | Accuracy | AUC-ROC |
|---|---|---|
| Logistic Regression | ~82% | ~0.88 |
| **Random Forest** | **~86%** | **~0.91** |
| Gradient Boosting | ~85% | ~0.90 |

**Best model: Random Forest** — used for identifying at-risk active customers

---

## 💡 Business Recommendations

1. **Flag customers after 2nd support call** — trigger proactive retention outreach
2. **Monthly satisfaction surveys** — escalate any score below 6
3. **90-day onboarding program** — cut early-tenure churn in half
4. **Upgrade offer for Basic plan** — offer discounted Standard plan at month 3–6
5. **Late payment early warning** — send retention offer after 2 missed payments

---

## 📁 Project Structure

```
customer-churn-analysis/
│
├── Customer_Churn_Analysis.ipynb  ← Main analysis + ML notebook
├── queries.sql                    ← 10 business SQL queries
├── requirements.txt               ← Python dependencies
├── README.md                      ← This file
│
├── customers.csv                  ← Customer table (5,000 rows)
├── transactions.csv               ← Transaction table (177K rows)
├── support_tickets.csv            ← Support tickets (8,887 rows)
│
└── charts/                        ← Generated visualizations
    ├── 01_churn_overview.png
    ├── 02_tenure_charges.png
    ├── 03_support_satisfaction.png
    ├── 04_revenue_payments.png
    ├── 05_correlation_heatmap.png
    ├── 06_model_evaluation.png    ← ROC curve + confusion matrix
    └── 07_feature_importance.png  ← Top churn predictors
```

---

## 🚀 How to Run

```bash
git clone https://github.com/Swethakaikala/customer-churn-analysis.git
cd customer-churn-analysis
pip install -r requirements.txt
jupyter notebook
# Open Customer_Churn_Analysis.ipynb → Kernel → Restart & Run All
```

---

## 🛠 Technologies Used

| Category | Tools |
|---|---|
| Data Engineering | Multi-table SQL-style joins, data integration, feature engineering |
| Data Analysis | Pandas, NumPy, EDA, statistical analysis |
| Machine Learning | Scikit-learn (Logistic Regression, Random Forest, Gradient Boosting) |
| Visualization | Matplotlib, Seaborn (ROC curves, heatmaps, KPI charts) |
| SQL | 10 business queries (churn rate, CLV, at-risk customers, revenue) |
| Version Control | GitHub |

---

## 👩‍💻 About Me

**Nagaswetha Kaikala** — Data Analyst / Data Scientist / Data Engineer  
M.S. Big Data Analytics, University of Central Missouri (GPA: 3.8)  
📍 Irving, TX | Open to Remote & Relocation | OPT Authorized

🔗 [LinkedIn](https://linkedin.com/in/Nagaswetha-Kaikala) | 📧 swethakaikala98@gmail.com  
🔗 [Other Projects](https://github.com/Swethakaikala)
