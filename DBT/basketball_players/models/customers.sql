with customers as (
    select * from {{ ref('stg_customers') }}
),

    orders as (
        select * from {{ref('stg_orders')}}
    ),
    payments as (
        select * from {{ref('stg_payments')}}
    ),

    final as (
        select orders.order_id, orders.order_date, orders.status
        FROM orders INNER JOIN customers ON
        orders.order_id = customers.customer_id
    )

select * from final



