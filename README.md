# 🌍 Global Sales Analysis and Forecasting using Google Cloud Platform (GCP)

## 📌 Project Description

This project aims to build a scalable and automated **ETL pipeline** to collect, clean, transform, unify, analyze, and forecast daily sales data from multiple international sources. The objective is to help stakeholders and management teams make informed decisions about **production planning**, **sales optimization**, and **tax compliance**.

The organization operates across **8 countries** and sells **5 product categories**, each with 6 unique products. Sales data is received in various formats (SQL, CSV, JSON, Excel, etc.) and currencies. This project processes these heterogeneous inputs into a **single unified dataset in INR** using **Apache Spark on Dataproc**, stores it in **BigQuery**, and provides visual and tabular insights for stakeholders.

---

## 🏗️ Architecture

```text
  +-------------+        +------------------+         +------------------------+
  | Data Source | -----> | Cloud Storage    | ----->  | Apache Spark on GCP    |
  | (CSV/SQL/JSON)       | Buckets (Raw)    |         | via Dataproc Cluster   |
  +-------------+        +------------------+         +------------------------+
                                                            |
                                                            v
                                                   +-------------------+
                                                   | Data Cleansing &  |
                                                   | Transformation    |
                                                   +-------------------+
                                                            |
                                                            v
                                                   +-------------------+
                                                   | BigQuery (INR)    |
                                                   +-------------------+
                                                            |
                          +---------------------------------+-------------------------------------+
                          |                                 |                                     |
                          v                                 v                                     v
               📊 Looker Studio                📥 CSV Link to GCS                     📈 Category/Country Charts
             (Stakeholder Dashboards)         (Manual Analysis)                    (Forecasting & Tax Reporting)



## ⚙️ Technologies Used

- **GCP Services**:  
  - Cloud Dataproc  
  - Cloud Storage  
  - BigQuery  
  - MySQL / AlloyDB (PostgreSQL)  
  - SQL Server  
- **Python & PySpark**
- **Pandas, NumPy, Matplotlib, Seaborn**
- **Excel, CSV, JSON Parsing**
- **Google Sheets / Looker Studio for visualization**

---

## 🚀 Project Approach

1. **Data Collection**  
   - Pull data from SQL Server, MySQL, AlloyDB
   - Load CSV, JSON, and Excel from Cloud Storage (Japan, HK, SL)

2. **Data Cleaning & Transformation**
   - Handle nulls, missing fields
   - Standardize column names (SaleId, Category, Product, Qty, Sale, Currency)
   - Convert all currency values to **INR**
   - Normalize units, fix invalid values

3. **Integration**
   - Merge datasets into a single PySpark DataFrame
   - Load final data into **BigQuery**

4. **Analysis**
   - Total sales and quantity per product, category, country
   - Tax computation (5% tax on all sales)
   - Generate Excel reports for stakeholders

5. **Forecasting**
   - Monthly forecast using time series (last N days of sales)
   - Provide estimated sales for next month

6. **Visualization**
   - Charts: sales by category, product, country
   - Dashboards for Tax Dept, Management, Sales Head
