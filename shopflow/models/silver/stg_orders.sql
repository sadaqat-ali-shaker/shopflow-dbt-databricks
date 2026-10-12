-- Silver layer: clean and standardize order data

SELECT
    TRIM(order_id) AS order_id,
    TRIM(customer_id) AS customer_id,
    CAST(order_date AS DATE) AS order_date,
    LOWER(TRIM(status)) AS status,
    CAST(total_amount AS DECIMAL(10, 2)) AS total_amount
FROM {{ ref('raw_orders') }}
