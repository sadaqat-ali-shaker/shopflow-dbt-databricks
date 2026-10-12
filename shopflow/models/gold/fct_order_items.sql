-- Gold layer: one row per order item

{{
    config(
        materialized='table'
    )
}}

SELECT
    order_item_id,
    order_id,
    product_id,
    product_name,
    product_category,
    quantity,
    unit_price,
    line_total

FROM {{ ref('int_order_items_with_product') }}
