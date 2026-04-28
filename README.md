# Sql_Data_Analytics_Project

> End-to-end exploratory data analysis and advanced business analytics — built entirely in SQL on a real sales data warehouse.

![SQL Server](https://img.shields.io/badge/SQL%20Server-T--SQL-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

---

## 🗺️ Context

This project is the **analytics layer** built on top of a fully modeled sales Data Warehouse (Gold Layer). It follows a structured, script-by-script approach that mirrors how real-world data analysts operate: starting from raw schema profiling, moving through exploratory analysis, then graduating to advanced business intelligence techniques.

The project is organized into **12 progressive SQL scripts**, each dedicated to a single analytical theme — making the codebase readable, modular, and reusable. No Python, no BI tools are needed to follow the logic; every insight is derived directly in T-SQL.

---

## 🧩 Business Problem

The business — a multi-country retail sales operation — needed clear answers to the following strategic questions:

- **Who are our best customers**, and how are they segmented by value and behavior?
- **Which products and categories drive the most revenue**, and which are underperforming?
- **How is our sales performance trending** over time — are we growing, plateauing, or declining?
- **What does our geographic footprint look like**, and which markets have untapped potential?
- **Where do we stand against our own historical average** — and how quickly are we improving?

These questions required moving beyond simple totals and building a full analytical layer on the warehouse.

---

## 🗃️ Data Sources

The analysis operates on the **Gold Layer** of a Star Schema Data Warehouse, built from two source systems — ERP and CRM — consolidated into three tables:

| Table | Type | Description |
|---|---|---|
| `gold.dim_customers` | Dimension | Customer demographics, geography, and segment attributes |
| `gold.dim_products` | Dimension | Product catalog with categories, subcategories, and pricing |
| `gold.fact_sales` | Fact | Transactional sales records — orders, quantities, revenues, dates |

**Dataset snapshot:**

| Metric | Value |
|---|---|
| Date Range | Dec 29, 2010 → Jan 28, 2014 |
| Total Revenue | **$29.35 Million** |
| Total Transactions | **60,379 orders** |
| Products Sold | **60,420+ units** |
| Unique Customers | **~18,484** |
| Avg. Price per Item | **$486.11** |
| Top Markets | 🇺🇸 USA ($9.16M) · 🇦🇺 Australia ($9.06M) · 🇬🇧 UK ($3.39M) |

---

## 🔬 Analytical Approach

The project follows a **layered analytical methodology** — building from foundational data profiling up to executive-level reporting:

```
Phase 1 — Exploration (Scripts 01–03)
  └── Profile the database: tables, columns, date boundaries, data types

Phase 2 — Measures & Magnitude (Scripts 04–06)
  └── Compute core KPIs, rank entities by volume, identify Pareto leaders

Phase 3 — Time Intelligence (Scripts 07–08)
  └── Trend analysis over time, running totals, moving averages

Phase 4 — Performance & Composition (Scripts 09–10)
  └── Period-over-period comparisons, YoY/MoM, share of total

Phase 5 — Segmentation & Reporting (Scripts 11–12)
  └── Customer & product tiers, consolidated business reports
```

Each script uses **only T-SQL** — leveraging window functions, CTEs, date functions, and conditional logic to answer specific business questions without any external tooling.

---

## 💡 Key Analytical Insights Demonstrated

**Revenue & Scale**
- The business generated **$29.35M** across ~3 years, averaging roughly **$10M/year**
- With an average item price of **$486**, the product range sits firmly in the mid-to-premium segment

**Geographic Performance**
- The **USA and Australia together contribute >60%** of total revenue ($9.16M + $9.06M)
- Canada ($1.98M) shows significant headroom compared to peers — a growth opportunity
- ~$230K in sales are unclassified by country — a **data quality flag** surfaced during EDA

**Customer Segmentation**
- ~18,484 unique customers place an average of **~3.3 orders each** over the period
- High-value customer segments, once isolated, can be profiled for retention and upsell targeting

**Trend Intelligence**
- Running total analysis reveals **compounding revenue accumulation** across quarters
- Moving averages smooth out seasonal noise to reveal the underlying growth trajectory

**Product Contribution**
- Part-to-whole analysis identifies which **subcategories dominate** the revenue mix vs. long-tail SKUs
- Top-N ranking queries surface the **~20% of products** responsible for the bulk of revenue

---

## 📂 Recommended Execution Order

Run the scripts sequentially — each phase builds on the data understanding established in the prior one:

```
01 database_exploration.sql        ← Start here: schema & table profiling
02 dimensions_exploration.sql      ← Understand dimension cardinality & nulls
03 date_range_exploration.sql      ← Establish time boundaries before trending
04 measures_exploration.sql        ← Compute foundational KPIs
05 magnitude_analysis.sql          ← Volume ranking by customer, product, region
06 ranking_analysis.sql            ← Formal Top-N / Bottom-N with window functions
07 change_over_time_analysis.sql   ← Monthly & yearly trend analysis
08 cumulative_analysis.sql         ← Running totals & moving averages
09 performance_analysis.sql        ← YoY / MoM & benchmark comparisons
10 part_to_whole_analysis.sql      ← % share & contribution per segment
11 data_segmentation.sql           ← Customer & product tier segmentation
12 product report.sql              ← consolidated product report
12 customer_report.sql             ← End here: consolidated customer report
```

> ⚠️ **Prerequisite:** The Gold Layer tables (`dim_customers`, `dim_products`, `fact_sales`) must be available in your SQL Server instance before running any script.

---

## 🧠 Skills Demonstrated

| Category | Techniques & Functions |
|---|---|
| **Database Profiling** | `INFORMATION_SCHEMA`, `sys.tables`, `sys.columns`, row count audits |
| **Aggregation & KPIs** | `SUM()`, `COUNT()`, `AVG()`, `MIN()`, `MAX()`, `ROUND()` |
| **Window Functions** | `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`, `NTILE()` |
| **Running Totals** | `SUM() OVER (ORDER BY date)` |
| **Moving Averages** | `AVG() OVER (ROWS BETWEEN N PRECEDING AND CURRENT ROW)` |
| **Period Comparisons** | `LAG()`, `LEAD()`, YoY/MoM delta calculations |
| **Time Intelligence** | `DATEPART()`, `DATETRUNC()`, `FORMAT()`, `DATEDIFF()` |
| **Share of Total** | `SUM() OVER ()` without PARTITION — global ratio calculations |
| **Segmentation Logic** | `CASE WHEN` tiering, `GROUP BY` cohorts, bucket/bin patterns |
| **Query Architecture** | CTEs (`WITH`), multi-join aggregations, subquery elimination |
| **Analytical Thinking** | Translating business questions into structured SQL logic |

---

## 🪪 License

This project is licensed under the [MIT License](LICENSE) — free to use, fork, and adapt with attribution.

---

## 🙋 About

**Mohammed Drihmi** — Data Analyst passionate about transforming raw data into actionable business insights.

[![GitHub](https://img.shields.io/badge/GitHub-MohammedDrihmi-181717?style=flat&logo=github)](https://github.com/MohammedDrihmi)
