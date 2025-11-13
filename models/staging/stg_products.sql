with products_sources as (
select
    *
from
    {{ source('ecommerce_analytics_dbt', 'products') }}
)
select
    cast(product_id as string) as product_id,
    trim(product_name) as product_name,
    cast(unitprice as float) as unit_price,
    trim(category) as category,
    trim(brand) as brand,
    cast(cost_price as float) as cost_price,
    cast(selling_price as float) as selling_price,
    cast(stock_quantity as int) as stock_quantity
from
    products_sources