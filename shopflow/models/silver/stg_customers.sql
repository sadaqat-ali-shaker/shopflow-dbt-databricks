-- Silver layer: clean and standardize customer data

SELECT
    TRIM(customer_id) AS customer_id,
    TRIM(first_name) AS first_name,
    TRIM(last_name) AS last_name,
    LOWER(TRIM(email)) AS email,
    UPPER(TRIM(country)) AS country,
    CAST(created_at AS TIMESTAMP) AS created_at
FROM {{ ref('raw_customers') }}
