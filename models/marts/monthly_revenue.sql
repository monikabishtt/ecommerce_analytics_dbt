with sales as (
    select *
    from {{ ref('fct_sales') }}
)

select
    date_trunc('month', order_date) as month,
    sum(revenue) as total_revenue,
    sum(profit) as total_profit,
    count(distinct order_id) as total_orders,
    sum(quantity) as total_units_sold
from sales
group by 1
order by 1
