with base as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status as order_status,
        case when order_status = 'fail' then  (amount * -1)::decimal/100::decimal else amount::decimal/100::decimal end as amount,
        created::date as order_created_at 
    
    from  {{ source('sunrise','stripe_payments') }}

) 

select * from base 