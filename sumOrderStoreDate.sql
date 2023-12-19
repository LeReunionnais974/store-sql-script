CREATE FUNCTION sales.sumOrderStoreDate (
	@store_id int,   
    @date date
    ) RETURNS decimal(10,2)
   
AS   
BEGIN
	DECLARE @result decimal(10,2)
    
	SET @result = (SELECT TOP(1)	
        SUM((order_items.quantity*order_items.list_price)*(1-order_items.discount)) AS amount
        FROM sales.orders
        LEFT JOIN sales.stores 
            ON (stores.store_id=orders.store_id)
        LEFT JOIN sales.order_items 
            ON (order_items.order_id=orders.order_id)
        where
            orders.order_date = @date 
            AND
            orders.store_id = @store_id
        GROUP BY 
        orders.order_date,
        orders.order_id,
        orders.store_id,
        stores.store_name)
	
	RETURN @result

END
