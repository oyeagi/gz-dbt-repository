WITH purchase_cost_subquery AS (
    SELECT *
        ,ROUND((s.quantity * p.purchase_price),2) AS purchase_cost
    FROM {{ref("stg_gz_raw_data__raw_gz_product")}} AS p
    JOIN {{ref("stg_gz_raw_data__raw_gz_sales")}} AS s
    USING (products_id)
    )

SELECT *
    ,ROUND((revenue - purchase_cost),2) AS margin
FROM purchase_cost_subquery