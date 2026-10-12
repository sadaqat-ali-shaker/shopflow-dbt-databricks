-- Intermediate layer: one row per order with customer and sales metrics

WITH orders AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        status,
        total_amount
    FROM {{ ref('stg_orders') }}
),

customers AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        email,
        country
    FROM {{ ref('stg_customers') }}
),

order_metrics AS (
    SELECT
        order_id,
        SUM(line_total) AS revenue,
        COUNT(*) AS number_of_lines,
        SUM(quantity) AS total_units
    FROM {{ ref('int_order_items_with_product') }}
    GROUP BY order_id
)

SELECT
    o.order_id,
    o.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.country AS customer_country,
    o.order_date,
    o.status,
    o.total_amount,
    COALESCE(m.revenue, 0) AS revenue,
    COALESCE(m.number_of_lines, 0) AS number_of_lines,
    COALESCE(m.total_units, 0) AS total_units
FROM orders AS o
LEFT JOIN customers AS c
    ON o.customer_id = c.customer_id
LEFT JOIN order_metrics AS m
    ON o.order_id = m.order_id
