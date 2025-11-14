with sales as (
    select *
    from {{ ref('fct_sales') }}
),
customers as (
    select *
    from {{ ref('dim_customers') }}
)

select 
    c.customer_id,
    c.region,
    c.loyalty_tier,
    count(distinct s.order_id) as total_orders,
    round(sum(s.quantity)) as total_units,
    round(sum(s.revenue)) as total_revenue,
    round(sum(s.profit)) as total_profit,
    min(s.order_date) as first_purchase_date,
    max(s.order_date) as last_purchase_date,
    round(avg(s.revenue),2) as avg_order_value
from customers c
left join sales s 
    on c.customer_id = s.customer_id
group by 
    c.customer_id, c.region, c.loyalty_tier
