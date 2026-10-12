-- Intermediate layer: enrich each order line with product details

SELECT
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS line_total,
    p.product_name,
    p.category AS product_category,
    p.price AS product_current_price
FROM {{ ref('stg_order_items') }} AS oi
LEFT JOIN {{ ref('stg_products') }} AS p
    ON oi.product_id = p.product_id
