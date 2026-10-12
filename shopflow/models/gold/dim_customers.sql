-- Gold layer: customer dimension for analytics

SELECT
    customer_id,
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS full_name,
    email,
    country,
    created_at AS customer_created_at
FROM {{ ref('stg_customers') }}
