with products as (
    select * from {{ ref('dim_products') }}
)
,sales as (
    select * from {{ ref('fct_sales') }}
)
select
    p.product_id,
    p.product_name,
    p.category,
    p.brand,
    sum(s.quantity) as total_units_sold,
    round(sum(s.revenue)) as total_revenue,
    round(sum(s.profit)) as total_profit,
    round(avg(s.unit_price),2) as avg_selling_price,
    round(avg(p.cost_price),2) as avg_cost_price     

from
    products p 
left join
    sales s
on p.product_id = s.product_id
group by 1,2,3,4