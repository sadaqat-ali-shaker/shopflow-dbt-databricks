-- Silver layer: clean and standardize product data

SELECT
    TRIM(product_id) AS product_id,
    TRIM(product_name) AS product_name,
    TRIM(category) AS category,
    CAST(price AS DECIMAL(10, 2)) AS price
FROM {{ ref('raw_products') }}
