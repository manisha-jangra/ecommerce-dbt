select
    {{ dbt_utils.generate_surrogate_key(['o.order_id','c.customer_id']) }} as order_key,
    o.order_id,
    c.customer_id,
    o.order_date,
    o.amount
from {{ ref('stg_orders') }} o
join {{ ref('stg_customers') }} c
on o.customer_id = c.customer_id