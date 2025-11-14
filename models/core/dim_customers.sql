with customers as (
select
    *
from {{ ref('stg_customers') }}
)
select
    customer_id,
    region,
    country,
    age_group,
    gender,
    loyalty_tier,
    signup_date,
    last_purchase_date,
    total_spent
from
    customers
