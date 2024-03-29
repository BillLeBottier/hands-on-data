
{{ config(
  materialized='view',
  tags=['marts']
) }}


SELECT
    s.sale_date AS date,
    p.category AS category,
    SUM(s.quantity * p.price) AS daily_revenue
FROM
    stg_sales s
JOIN
    stg_products p ON s.product_id = p.product_id
GROUP BY
    s.sale_date,
    p.category
