with  orders as (

    select * from {{ ref ('stg_orders')}}

), stripe_payments as (

    select * from {{ ref('stg_payments')}}

), final as (

    select

        orders.order_id,
        orders.customer_id,
        sum(amount) as amount

    from orders

    left join stripe_payments
        on orders.order_id = stripe_payments.order_id

    where status = 'success'    

    group by 1, 2

    order by 3 desc nulls last
)

select * from final
