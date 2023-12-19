CREATE VIEW production.salesCatalog
AS  

SELECT
    SUM((order_items.quantity*order_items.list_price)*(1-order_items.discount)) AS amount,
    product_id,
    year(order_date) as annee,
    month(order_date) as mois
FROM sales.orders
LEFT JOIN sales.order_items 
    ON (order_items.order_id=orders.order_id)
GROUP BY 
    product_id,
    year(order_date),
    month(order_date) 
