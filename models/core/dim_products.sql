with products as (
select
    *
from
    {{ ref('stg_products') }}
)
select
    product_id,
    product_name,
    unit_price,
    category,
    brand,
    cost_price,
    selling_price,
    stock_quantity
from
    products