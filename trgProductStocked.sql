CREATE TRIGGER production.trgProductStocked
ON production.products
AFTER INSERT
AS
	DECLARE @product_id INT

		SELECT @product_id = i.product_id FROM inserted i

		INSERT INTO production.stocks(store_id, product_id, quantity)
		VALUES (1, @product_id, 0), (2, @product_id, 0), (3, @product_id, 0)
GO