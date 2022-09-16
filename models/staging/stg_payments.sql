    select
        id ,
        orderid ,
        paymentmethod ,
        status ,
        -- `amount` is currently stored in cents, so we convert it to dollars
        amount / 100 as amount,
        created ,
        _batched_at
    from
    --    raw.stripe.payment
         {{ source('src_jaffle_shop_strip', 'payment') }}