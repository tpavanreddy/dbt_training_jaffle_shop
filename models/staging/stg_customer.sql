select
    id as customer_id,
    first_name,
    last_name

--from raw.jaffle_shop.customers

from
    {{ source('src_jaffle_shop', 'customers') }}