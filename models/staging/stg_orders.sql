with orders_source as (
select
    *
from
    {{ source('ecommerce_analytics_dbt', 'orders') }}
)
, orders_updated as (
select
    invoiceno as order_id,
    stockcode as product_id,
    description as product_name,
    quantity,
    to_timestamp(InvoiceDate, 'DD/MM/YYYY HH24:MI') as order_date,
    unitprice as unit_price,
    (unitprice * quantity) as total_value,
    customerid as customer_id,
    trim(country) as country
from
    orders_source
)

select * from orders_updated