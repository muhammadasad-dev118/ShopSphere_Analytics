<div align="center">

<!-- Animated Typing SVG Banner -->
<a href="https://github.com/muhammadasad-dev118/ShopSphere_Analytics">
  <img src="https://readme-typing-svg.demolab.com?font=Inter&weight=700&size=28&duration=3000&pause=1000&color=14B8A6&center=true&vCenter=true&repeat=true&width=820&lines=ShopSphere+E-Commerce+Analytics;Power+BI+Dashboard+%7C+PostgreSQL+%7C+Excel;Revenue+%7C+Gross+Profit+%7C+Customer+Segments" alt="Typing SVG" />
</a>

<br />

<!-- Tech Stack Badges -->
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![Orders](https://img.shields.io/badge/Records-14%2C040%20Line%20Items-10B981?style=for-the-badge)
![Unique Orders](https://img.shields.io/badge/Orders-7%2C799%20Unique-0EA5E9?style=for-the-badge)

</div>

---

## Overview

An end-to-end **E-Commerce Sales & Customer Analytics** solution for **ShopSphere**, integrating **PostgreSQL** relational queries, **Excel** data cleaning, and an interactive **Power BI** dashboard across **14,040 order line items**, **7,799 unique orders**, **1,300 customers**, and **120 SKUs**.

The project tracks top-line revenue, net gross profit after unit cost and shipping, time-series order velocity, category revenue share, customer loyalty segments, and city-level demand concentration.

---

## Executive KPI Snapshot

| KPI Metric | Headline Value | SQL / DAX Calculation Logic | Business Purpose |
| :--- | :--- | :--- | :--- |
| **Total Revenue** | **277.25M** (`277,251,210.00`) | `SUM(orders_Raw.sales_amount)` | Measures overall gross top-line sales |
| **Gross Profit** | **69.87M** (`69,870,211.00`) | `SUM(sales_amount − (quantity × unit_cost) − shipping_cost)` | Tracks net profit after COGS & shipping |
| **Unique Orders** | **7,799** | `COUNT(DISTINCT order_id)` | Total completed customer transactions |
| **Total Quantity Sold** | **23,891 units** | `SUM(orders_Raw.quantity)` | Aggregate unit volume moved |
| **Avg Items per Order** | **3.06 items** | `SUM(quantity) ÷ COUNT(DISTINCT order_id)` | Basket size & cross-sell effectiveness |

---

## Key Analytical Insights

* **Category Revenue Concentration:** **Electronics** dominates sales at **109.19M (39.38%)** (plus **3.62M / 1.31%** from unstandardized lowercase `electronics` rows—highlighting a clear data-standardization opportunity), followed by **Home & Kitchen (66.93M / 24.14%)** and **Sports (39.48M / 14.24%)**.
* **Customer Segment Breakdown:** **Regular** customers generate the largest revenue share at **103.35M (37.28%)**, followed by **Loyal (60.27M / 21.74%)**, **New (52.49M / 18.93%)**, **At Risk (38.94M / 14.05%)**, and **VIP (22.14M / 7.98%)**.
* **Top-Performing Metro Hubs:** **Karachi (22.62M)**, **Muzaffarabad (21.21M)**, **Peshawar (19.50M)**, **Sukkur (19.36M)**, and **Gujranwala (18.16M)** lead regional order volume and revenue.
* **Top vs. Bottom Products:** High-margin tech accessories—**Wireless Earbuds (`P0004`, 21.47M)**, **Power Bank (`P0003`, 20.10M)**, and **Phone Charger (`P0005`, 10.81M)**—anchor top-line sales, while everyday grocery staples (**Juice Pack `P0082`**, **Flour 5kg `P0080`**) sit at the bottom of revenue generation.

---

## Repository Contents

<details open>
<summary><strong>Click to expand / collapse Project Files</strong></summary>

```text
ShopSphere_Analytics/
├── README.md                    # Project documentation, KPI summary & business insights
├── ShopSphere Analytics.pbix    # Interactive Power BI dashboard file
├── Shopshpere Analytics.sql     # PostgreSQL schema creation & analytical KPI/chart queries
├── Order_sale.csv               # 14,040 order transaction line items
├── Products_sale.csv            # 120 product SKUs with unit price, unit cost & supplier info
└── customer_sales.csv           # 1,300 customer profiles with city, region & segment tags# ShopSphere_Analytics
