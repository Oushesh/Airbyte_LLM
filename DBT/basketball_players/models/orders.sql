with source as (
    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_orders') }}
),

     renamed as (
         select
             id as order_id,
             user_id as customer_id,
             order_date,
             status
         from source
     ),

     customers as (
         select * from {{ ref('stg_customers') }}
     ),

     final as (
         select
             orders.order_id,
             orders.order_date,
             orders.status
         from renamed as orders
                  inner join customers
                             on orders.customer_id = customers.customer_id
     )

select * from final
