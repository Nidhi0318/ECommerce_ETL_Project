# E-Commerce Multi-Channel Sales Integration

## 1. Introduction

This project integrates e-commerce clickstream data and retail sales data from multiple sources using PySpark and MySQL. The objective is to clean raw data, process valid records, analyze customer behavior, and generate sales summaries for business decision-making.

## 2. Problem Statement

An online retail company collects user behavior data in JSON format and retail sales records in CSV format. These datasets must be cleaned, integrated into a common analytical workflow, and stored in a relational database to support sales and customer behavior analysis.

## 3. Objectives

* Process JSON clickstream logs and CSV retail sales logs.
* Clean invalid and duplicate records.
* Separate invalid records from valid records.
* Calculate transaction revenue.
* Analyze product performance and customer purchases.
* Generate hourly sales summaries.
* Store processed datasets in MySQL for querying.

## 4. Technologies Used

* Python
* PySpark
* Pandas
* Jupyter Notebook
* MySQL Workbench
* SQL
* JSON and CSV file formats

## 5. Data Sources

### Clickstream Data

The clickstream dataset contains user and session information, event types, timestamps, product identifiers, category identifiers, and prices.

### Retail Sales Data

The retail sales dataset contains customer identifiers, transaction identifiers, date and time, quantity, price, product identifiers, and transaction status.

## 6. ETL Process

### Extract

Raw clickstream data was read from a JSON file, and retail sales data was read from a CSV file using PySpark.

### Transform

Data transformation included timestamp parsing, validation of required fields, filtering invalid records, removing duplicate records, calculating transaction amounts, and grouping sales by date and hour.

### Load

Cleaned datasets were exported as CSV files and loaded into the MySQL database `ecommerce_etl`. The hourly sales summary was also stored in MySQL.

## 7. Data Cleaning

Clickstream validation included checking user and session identifiers, valid timestamps, permitted event types, and positive prices. Duplicate events were removed.

Sales validation included checking customer and transaction identifiers, valid timestamps, positive quantities and prices, and finalized transaction status. Duplicate transactions were removed.

The clickstream cleaning process retained 26 records from 30 original records and rejected 4 records.

## 8. Database Design

The MySQL database is named `ecommerce_etl`.

The main tables are:

* `clickstream_clean`: stores cleaned clickstream events.
* `sales_clean`: stores cleaned retail sales transactions.
* `hourly_sales_summary`: stores aggregated sales by date and hour.

## 9. SQL Analysis

SQL queries were used to calculate total sales revenue, revenue by product, customer purchase summaries, clickstream event counts, and product-level views, cart events, and purchases.

The hourly sales summary contains total revenue, total quantity sold, and distinct transaction counts for each date and hour.

## 10. Results

The pipeline successfully processed the input datasets, created cleaned CSV outputs, loaded the cleaned data into MySQL, and generated an hourly sales summary.

The project supports querying sales performance and customer activity through SQL.

## 11. Conclusion

The project demonstrates an end-to-end ETL workflow using PySpark, Python, Pandas, and MySQL. It converts raw multi-channel retail data into structured, cleaned, and queryable datasets that support business analysis and decision-making.

## 12. Future Enhancements

* Automate ETL execution on a schedule.
* Create dashboards for sales and customer behavior.
* Add product conversion-rate analysis.
* Process larger datasets using distributed storage.
* Introduce data quality reports and monitoring.
