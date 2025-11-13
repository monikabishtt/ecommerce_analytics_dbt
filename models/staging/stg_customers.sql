with customers_sources as (
select
    *
from
    {{ source('ecommerce_analytics_dbt', 'customers') }}
)
select
    customerid as customer_id,
    region,
    country,
    age_group,
    gender,
    loyalty_tier,
    signup_date,
    last_purchase_date,
    total_spent
from
    customers_sources