-- Gold layer: product dimension for analytics

SELECT
    product_id,
    product_name,
    category,
    price AS current_price
FROM {{ ref('stg_products') }}
