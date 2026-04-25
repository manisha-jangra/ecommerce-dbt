select
    id as order_id,
    user_id as customer_id,
    order_date,
    status,
    amount,
    created_at
from {{ source('ecommerce', 'orders') }}