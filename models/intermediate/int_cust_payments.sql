with payments as (
    select * from {{ ref('stg_payments') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

customer_payments as (

    select
        orders.customer_id,
        sum(amount) as total_amount

    from payments 

    left join orders on
         payments.orderid = orders.order_id

    group by orders.customer_id
)

select 
    *
from
    customer_payments