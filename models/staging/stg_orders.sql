with orders_source as (
    select *
    from {{ source('ecommerce_analytics_dbt', 'orders') }}
),

cleaned as (
    select
        invoiceno as order_id,
        stockcode as product_id,
        description as product_name,
        quantity,

        coalesce(
        try_to_timestamp(invoicedate, 'M/D/YYYY H:MI'),
        try_to_timestamp(invoicedate, 'M/D/YYYY HH24:MI'),
        try_to_timestamp(invoicedate, 'MM/DD/YYYY H:MI'),
        try_to_timestamp(invoicedate, 'MM/DD/YYYY HH24:MI'),
        try_to_timestamp(invoicedate)
        ) as order_date,


        unitprice as unit_price,
        (unitprice * quantity) as total_value,

        -- Consistent cleaning
        split_part(to_varchar(customerid), '.', 1) as customer_id,

        trim(country) as country
    from orders_source
    where invoiceno is not null        -- only remove fully broken rows
)

select *
from cleaned
