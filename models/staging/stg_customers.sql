with customers_sources as (
select
    *
from
    {{ source('ecommerce_analytics_dbt', 'customers') }}
)
select
    split_part(to_varchar(customerid),'.',1) as customer_id,
    trim(region) as region,
    country,
    age_group,
    gender,
    loyalty_tier,
    cast(signup_date as date) as signup_date,
    cast(last_purchase_date as date) as last_purchase_date,
    cast(total_spent as float) as total_spent
from
    customers_sources
where customer_id is not null