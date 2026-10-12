-- Silver layer: clean and standardize order item data

SELECT
    TRIM(order_item_id) AS order_item_id,
    TRIM(order_id) AS order_id,
    TRIM(product_id) AS product_id,
    CAST(quantity AS INT) AS quantity,
    CAST(unit_price AS DECIMAL(10, 2)) AS unit_price
FROM {{ ref('raw_order_items') }}
