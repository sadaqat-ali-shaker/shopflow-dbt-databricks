{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='order_id',
        merge_update_columns=[
            'customer_id',
            'order_date',
            'status',
            'total_amount',
            'revenue',
            'number_of_lines',
            'total_units',
            'customer_country'
        ]
    )
}}
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,
    o.total_amount,
    o.revenue,
    o.number_of_lines,
    o.total_units,
    c.country AS customer_country

FROM {{ ref('int_orders_enriched') }} AS o

LEFT JOIN {{ ref('dim_customers') }} AS c
    ON o.customer_id = c.customer_id

{% if is_incremental() %}
    WHERE o.order_date >= (
        SELECT DATE_ADD(MAX(order_date), -7)
        FROM {{ this }}
    )
{% endif %}
