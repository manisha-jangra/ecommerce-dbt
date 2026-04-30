select
    id as customer_id,
    first_name,
    last_name,
    email,
    created_at
from {{ source('ecommerce', 'customers') }}
where first_name is not null