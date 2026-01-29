![Project Cover](project_cover.png)

# 🇧🇷 Olist E-Commerce Operations Analysis

## 📌 Project Overview

Goal: Audit Olist's e-commerce operations to identify logistics bottlenecks, top-performing products, and payment trends.
Role: Data Analyst (End-to-End).
Tools: SQL (MySQL), Power BI, Excel ==> (For Initial Validation & CSV Inspection).

## 💾 Data Source

The dataset used for this project is provided by Olist and hosted on Kaggle. It contains information on 100k orders from 2016 to 2018 made at multiple marketplaces in Brazil.

Dataset Link: Brazilian E-Commerce Public Dataset by Olist

## 💼 The Business Problem

The executive management at Olist wants to improve customer satisfaction and operational efficiency. The key questions to be answered are:

**Key Questions:**

01.Logistics: Are we delivering on time? What is the delay rate?
02. Sales Performance: Which product categories are driving revenue?
03. Payment Behavior: How do customers prefer to pay? Does installment payment affect basket size?

## 🛠️ Technical Approach

### 1. Data Engineering (SQL)

**Ingestion: Handled complex CSV imports using LOAD DATA LOCAL INFILE to bypass encoding issues.**

**Cleaning:**
- Fixed date formats using STR_TO_DATE with conditional logic for mixed formats.
- Cleaned currency and numeric fields (removed symbols, handled negative values).
- Removed duplicates using GROUP BY and aggregation logic.
- Transformation: Created two clean master tables (clean_orders, clean_items) optimized for analysis.

### 2. Visualization (Power BI)
- Built an interactive dashboard to visualize operations.
- Data Modeling: Built a Star Schema connecting 5 tables with proper relationships.
- DAX Measures: Created dynamic measures for KPIs like Delivery Delay % and Average Order Value.
- UI/UX: Designed a custom background layout adhering to Olist's brand identity (Royal Blue & Orange).

## 📊 Key Insights (The Story)

01. **Logistics Challenge:** The delivery delay rate is 7.87%. While acceptable, this represents a significant number of unhappy customers.
02. **Revenue Drivers:** The top revenue-generating categories are "Health & Beauty" and "Watches". These are high-value, easy-to-ship items.
03. **Payment Strategy:** Credit Cards are the dominant payment method (75%+). Interestingly, credit card orders have a **higher Average Order Value ($163)** compared to Cash/Boleto ($145), suggesting that installment options encourage higher spending.

📷 Project Visuals

🖥️ Desktop Dashboard

![Desktop Dashboard](Dashboard/dashboard.png)

📂 Files Included

- `MySQL/Olist_ETL.sql - Olist_Business_Analysis.sql`: Full ETL, Cleaning, and Analysis scripts.
- `Dashboard/BR.pbix`: Power BI source file.
- `Data/`: Sample of the cleaned datasets.
