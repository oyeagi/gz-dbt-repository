SELECT 
    om.orders_id
    ,om.date_date
    ,om.revenue
    ,om.margin    
    ,om.margin + sh.shipping_fee - (sh.logcost + sh.ship_cost) AS operational_margin
FROM {{ref("int_orders_margin")}} AS om
LEFT JOIN {{ref("stg_gz_raw_data__raw_gz_ship")}} AS sh
USING (orders_id)