CREATE FUNCTION [sales].[countOrderDate](@date AS DATE)

RETURNS INT
AS
BEGIN

	Declare @result INT

		SELECT @result = 
			COUNT(order_id)
		FROM sales.orders
		WHERE order_date = @date 

	RETURN @result

END