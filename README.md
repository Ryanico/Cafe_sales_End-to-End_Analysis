# ☕ Cafe Sales Analysis

An end-to-end data analytics project analysing café sales data using **Python, SQL, and Power BI**.

The project focuses on transforming a messy dataset into actionable business insights by cleaning the data, analysing sales performance, and building an interactive dashboard for decision-making.

---

## 📊 Dashboard Preview

<img width="1366" height="768" alt="Screenshot (195)" src="https://github.com/user-attachments/assets/7926074c-12d4-4af1-97d4-1e1d58bf0c99" />


## 🔎 Project Overview

The dataset contains **10,000 café transactions** with intentional data quality issues, including missing values, invalid entries, and inconsistent records.

The objective was to simulate a real-world data analyst workflow:

**Raw Data → Python Data Cleaning → Exploratory Data Analysis → SQL Business Analysis → Power BI Dashboard → Business Recommendations**

The analysis focuses on understanding:

- Sales and revenue performance
- Product performance
- Customer purchasing behaviour
- Payment method preferences
- Location performance
- Monthly and weekly sales trends
- Weekend vs weekday sales

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| **Python** | Data cleaning and exploratory analysis |
| **Pandas** | Data manipulation and transformation |
| **NumPy** | Numerical operations |
| **Matplotlib & Seaborn** | Data visualisation |
| **MySQL** | Business and sales analysis |
| **Power BI** | Interactive dashboard and reporting |
| **GitHub** | Project documentation and version control |

---

# 1. 🧹 Data Cleaning — Python

The raw dataset contained several data quality issues that needed to be addressed before analysis.

### Data Quality Issues Identified

- Missing values
- `ERROR` values
- `UNKNOWN` values
- Missing product names
- Missing quantities
- Missing prices
- Missing total spending
- Missing payment methods
- Missing locations
- Missing transaction dates
- Inconsistent data types

### Cleaning Steps

Using Python and Pandas, I:

- Inspected the structure and quality of the dataset
- Identified missing and invalid values
- Removed invalid `ERROR` records
- Removed transactions with missing product information
- Handled missing categorical values
- Converted columns to appropriate data types
- Converted transaction dates to datetime format
- Validated the relationship between quantity, price, and total spending
- Recalculated transaction totals where possible
- Removed records that could not be reliably recovered

### Feature Engineering

Created additional analytical features from the transaction date:

- Year
- Quarter
- Month
- Month Name
- Weekday
- Weekend / Weekday classification

---

# 2. 📈 Exploratory Data Analysis — Python

After cleaning the data, exploratory analysis was performed to identify patterns and trends.

### Sales Analysis

- Total revenue
- Total number of transactions
- Average transaction value
- Monthly revenue trends
- Highest revenue month
- Sales by weekday
- Weekend vs weekday performance

### Product Analysis

- Top-selling products
- Highest revenue-generating products
- Lowest-performing products
- Product contribution to total revenue

### Payment Analysis

- Most commonly used payment method
- Revenue by payment method

### Location Analysis

- Revenue by location
- Transaction volume by location
- Highest-performing locations

---

# 3. 🗄️ SQL Analysis — MySQL

The cleaned dataset was loaded into MySQL to perform structured business analysis.

The SQL analysis covered:

### Sales Performance

- Total revenue
- Total transactions
- Average transaction value
- Highest and lowest transaction values

### Product Performance

- Best-selling products
- Highest revenue-generating products
- Lowest-performing products
- Average quantity sold per product

### Time-Based Analysis

- Monthly revenue
- Quarterly revenue
- Sales by weekday
- Weekend vs weekday sales
- Monthly revenue trends

### Location Analysis

- Revenue by location
- Transaction volume by location
- Average revenue by location

### Payment Analysis

- Revenue by payment method
- Most popular payment method

Advanced SQL techniques were also applied, including:

- CTEs
- Window Functions
- `RANK()`
- `DENSE_RANK()`
- `LAG()`
- Running totals
- Cumulative revenue
- Revenue contribution analysis

---

# 4. 📊 Power BI Dashboard

The final cleaned dataset was used to build an interactive Power BI dashboard.

The dashboard provides a high-level view of café performance and allows users to explore sales trends and performance across different dimensions.

### Key Metrics

- Total Revenue
- Total Transactions
- Average Transaction Value
- Total Products Sold
- Number of Locations

### Dashboard Analysis

The dashboard visualises:

- Monthly revenue trends
- Product performance
- Top-selling products
- Revenue by location
- Payment method distribution
- Weekend vs weekday performance

### Interactive Filters

Users can filter the analysis by:

- Date
- Month
- Product
- Location
- Payment Method

---

# 💡 Key Business Questions

The analysis was designed to answer the following questions:

1. Which products generate the most revenue?
2. Which products are the most popular?
3. Which products are underperforming?
4. Which month generates the highest revenue?
5. Which weekday generates the highest sales?
6. Are weekend sales higher than weekday sales?
7. Which payment method is most preferred?
8. Which location generates the most revenue?
9. Which products should be promoted?
10. What actions can management take to improve sales performance?

---

# 📌 Key Insights

### 🥇 Top-Performing Products

**Salad generated the highest revenue among all products, making it the café's top-performing product. 
The café should prioritise its availability and consider promotional strategies to maximise its sales potential.**

### 📅 Sales Trends

**January generated the highest monthly revenue at 3063.50, while May recorded the lowest revenue. 
This indicates fluctuations in monthly sales performance and highlights an opportunity to investigate the factors driving peak and low-demand periods.**

### 📆 Weekend Performance

**Weekday sales exceeded weekend sales, suggesting that customer demand is stronger during the working week. 
The café could focus on maintaining weekday performance while introducing weekend promotions and offers to encourage more customer visits.**

Weekend sales accounted for **8887** of total revenue, compared with **21,799.5** from weekdays.

### 💳 Payment Behaviour

**Digital Wallet generated the highest revenue among the available payment methods, suggesting that customers using digital payments contribute significantly to overall sales. 
The café should continue prioritising convenient digital payment options to support a seamless customer experience.**

### 📍 Location Performance

**Instore recorded the highest revenue, while Takeaway generated the lowest. This difference in performance suggests that customer demand and sales potential vary across locations. 
Management should investigate the factors influencing performance and develop targeted strategies to improve lower-performing locations.**

**In-store** generated the highest revenue, while **Takeaway** recorded the lowest performance.

---

# 💼 Business Recommendations

Based on the analysis, the following recommendations can be considered:

### 1. Focus on High-Performing Products

Increase the visibility and availability of top-performing products through targeted promotions and product bundles.

### 2. Improve Underperforming Products

Review low-performing products to determine whether pricing, marketing, product placement, or customer demand is affecting their performance.

### 3. Optimise Inventory

Use historical sales trends to improve inventory planning and reduce the risk of stock shortages during high-demand periods.

### 4. Target Low-Sales Periods

Introduce targeted promotions during slower periods to encourage customer visits and increase revenue.

### 5. Monitor Location Performance

Investigate differences between locations to identify operational or market factors that may be affecting sales.

---

# 📁 Project Structure

```text
Cafe-Sales-Analysis/
│
├── data/
│   ├── raw/
│   └── cleaned/
│
├── notebooks/
│   ├── Cafe_Analysis.ipynb
│
├── sql/
│   └── Cafe_Sales_Analysis.sql
│
├── powerbi/
│   └── Cafe_Sales_Dashboard.pbix
│
├── images/
│   └── cafe_sales_dashboard.png
│
├── README.md
