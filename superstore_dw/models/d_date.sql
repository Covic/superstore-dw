select
  order_id,
  order_date
from {{ source("norm", "t_order") }}