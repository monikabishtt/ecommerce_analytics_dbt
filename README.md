# E-commerce Analytics Pipeline (dbt + Snowflake)
This project demonstrates a complete analytics engineering workflow using:
dbt Cloud for transformations
Snowflake as the data warehouse
GitHub for version control
dbt_utils + codegen for automation and testing
The dataset is based on a real-world e-commerce transactions dataset containing customer, product, and order information.
## 📐 Project Architecture
RAW → STAGING → CORE (Dims & Facts) → MARTS → DASHBOARDS
RAW Layer (Snowflake)
Stores raw CSV data exactly as received.
STAGING Layer (dbt)
Cleaned and standardized tables:
stg_orders
stg_products
stg_customers
Tasks include:
Timestamp parsing
Type casting
Null handling
Standardizing identifiers
CORE Layer
Dimensional modeling using a star schema:
dim_customers
dim_products
fct_sales
The fact table calculates:
Revenue
Profit
Line-level sales KPIs
MARTS Layer
Business-friendly aggregated tables:
customer_sales_summary
product_performance
monthly_revenue
Used for BI dashboards and reporting.



## 📁 Project Structure
models/
├── staging/
│   ├── stg_orders.sql
│   ├── stg_products.sql
│   └── stg_customers.sql
│
├── core/
│   ├── dim_customers.sql
│   ├── dim_products.sql
│   └── fct_sales.sql
│
└── marts/
    ├── monthly_revenue.sql
    ├── customer_sales_summary.sql
    └── product_performance.sql


### <img width="1426" height="592" alt="image" src="https://github.com/user-attachments/assets/e1aeedd8-3d2e-475f-b5d6-65a4c1a03eda" />



