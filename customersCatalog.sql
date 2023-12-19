CREATE VIEW sales.customersCatalog
AS  

SELECT
      store_name,
      first_name,
      last_name,
      customers.email
FROM sales.orders
LEFT JOIN sales.stores
      ON (orders.store_id = stores.store_id)
LEFT JOIN sales.customers
      ON (orders.customer_id = customers.customer_id)