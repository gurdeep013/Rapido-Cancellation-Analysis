# 📊 Rapido Ride Cancellation & Performance Analysis — July 2025

This repository contains an end-to-end analytics project performed on **Rapido’s July 2025 ride dataset**, covering data cleaning, SQL analysis, dashboarding, insights, and stakeholder-ready reporting.

The goal of this project is to analyze **ride cancellations, customer behavior, operational efficiency, and overall business performance**, and provide clear recommendations to help Rapido improve reliability and customer satisfaction.

---

## 🚀 Project Overview

This project simulates a real analytics workflow:

1. **Understanding the business problem**
2. **Data cleaning & transformation (Python)**
3. **Analytical querying & KPI extraction (MySQL)**
4. **Dashboard creation (Looker Studio)**
5. **Insight generation & storytelling**
6. **Business recommendations**
7. **Final report + presentation**

---

## 🗂️ Repository Structure

Rapido Cancellation Analysis/
│
├── dashboard/  
├── MySQL/  
├── presentation/  
├── Python/  
├── report/  
└── Stakeholder problem/  

---

## 🔧 Tools & Technologies Used

| Stage | Tools |
|-------|--------|
| Data Prep | Python (Pandas, NumPy) |
| Analysis | MySQL Workbench |
| Dashboard | Looker Studio |
| Reporting | PDF, PowerPoint |
| Documentation | Markdown, GitHub |

---

## 🧹 1. Data Preparation (Python)

Performed key preprocessing steps:

- Cleaned date/time fields  
- Engineered features like ride_status, hour, weekday  
- Exported dashboard-ready CSVs:
  - rapido_cleaned.csv
  - daily_summary.csv
  - customer_segments.csv
  - payment_summary.csv
  - vehicle_summary.csv
  - city_matrix.csv

Notebook: Python/rapido_cancellation.ipynb

---

## 🛢️ 2. SQL Analysis (MySQL)

Created analytical queries to extract:

- Total rides, revenue, and cancellation KPIs  
- Customer segmentation (One-time / Occasional / Frequent)  
- Payment behavior trends  
- Peak hour analysis  
- Pickup → Drop route demand  
- Vehicle performance  
- Top drivers & incomplete ride reasons  

Outputs stored in: `MySQL/Outputs/*.csv`

---

## 📊 3. Dashboard (Looker Studio)

Dashboard highlights:

- Daily ride trends  
- Cancellation distribution  
- Customer segments  
- Payment method usage  
- Peak ride hours  
- Pickup–Drop heatmap  
- Vehicle performance  

Files:
- dashboard/Rapido_Ride_Analytics_Dashboard.pdf  
- Live dashboard link (in TXT file)

---

## 🔍 4. Key Insights

- Cancellation rate ≈ 12%  
- Frequent users contribute ~40% of all rides  
- Payment method influences cancellations  
- Peak demand at 9 AM & 6 PM  
- Incomplete rides mainly due to network issues & delays  
- Bikes offer faster trips, autos generate higher fares  

---

## 🚀 5. Recommendations

- Strengthen driver incentives during peak hours  
- Improve reliability to reduce incomplete rides  
- Promote digital payments  
- Engage frequent riders through loyalty programs  
- Optimize supply in high-demand corridors  

---

## 📝 Final Deliverables

- Full Report → /report/Rapido_Analytics_Report.pdf  
- Presentation → /presentation/Rapido_July2025_Presentation.pptx  
- Dashboard → /dashboard/Rapido_Ride_Analytics_Dashboard.pdf  
- Python Notebook → /Python/rapido_cancellation.ipynb  
- SQL Outputs → /MySQL/Outputs/*.csv  

---

## 🙌 Author

**Gurdeep Singh**  
_Data Analyst — Python | SQL | BI Dashboards_

