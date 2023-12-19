CREATE TRIGGER sales.trgOrders
ON sales.orders
after UPDATE
AS
BEGIN
	declare @order_id int
	declare @date varchar(255)
	declare @new_value varchar(255)
	
	IF UPDATE(order_status) 
	BEGIN
	     select @order_id=i.order_id from inserted i 
		 
		 select @date=DATEADD(day,3,i.order_date) from inserted i 
		
		UPDATE  sales.orders set shipped_date =@date where order_id=@order_id
		
	END
END
GO
