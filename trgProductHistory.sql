CREATE TRIGGER production.trgProductHistory
ON production.products
AFTER UPDATE
AS
BEGIN
	declare @product_id int
	declare @old_value varchar(255)
	declare @new_value varchar(255)
	declare @date date
	IF UPDATE(list_price) 
	BEGIN
	     select @product_id=i.product_id from inserted i 
		
		 select @old_value =  d.list_price from deleted d
		
		
		 select @new_value =  i.list_price from inserted i
		 select @date =g etdate()


		INSERT INTO history_products (product_id,old_value, new_value, date)
		VALUES (@product_id,CAST(@old_value AS varchar(255)),CAST(@new_value AS varchar(255)),@date)
	END
END
