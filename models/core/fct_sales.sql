with orders as (
    select * from {{ ref('stg_orders') }}
)
,products as (
    select * from {{ ref('stg_products') }}
)
,customers as (
    select * from {{ ref('stg_customers') }}
)
select
    o.order_id,
    o.order_date,
    o.customer_id,
    c.region,
    c.loyalty_tier,
    o.product_id,
    p.category,
    p.brand,
    o.quantity,
    o.unit_price,
    p.cost_price,
    (o.quantity * o.unit_price) as revenue,
    (o.quantity * (o.unit_price - p.cost_price)) as profit
from
    orders o 
left join products p on o.product_id = p.product_id
left join customers c on o.customer_id = c.customer_id