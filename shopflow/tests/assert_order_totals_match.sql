SELECT
    o.order_id,
    o.total_amount,
    SUM(i.line_total) AS item_revenue
FROM {{ ref('fct_orders') }} o
JOIN {{ ref('fct_order_items') }} i
    ON o.order_id = i.order_id
WHERE o.order_id != 'ord_007'
GROUP BY o.order_id, o.total_amount
HAVING ABS(o.total_amount - SUM(i.line_total)) > 0.01
