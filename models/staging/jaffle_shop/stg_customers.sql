with customers as (
    
    select 
        id as customer_id,
        first_name,
        last_name

    from sunrise.jaffle_shop_customers
)

select * from customers
