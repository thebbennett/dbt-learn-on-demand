with base as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status as order_status,

        -- amount is stored in cents, convert it to cents_to_dollars
        {{ cents_to_dollars('payment_amount') }} as amount,
        created::date as order_created_at

    from  {{ source('sunrise','stripe_payments') }}

)

select * from base
