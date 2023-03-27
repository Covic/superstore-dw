select
    o.row_id,
    o.order_id,
    o.customer_id,
    o.city,
    o.ship_date,
    o.ship_mode,
    o.postal_code,
    o.product_id,
    o.category,
    o.sub_category,
    o.product_name,
    o.sales,
    o.quantity,
    o.discount,
    o.profit    
from {{ source("norm", "orders") }} o
