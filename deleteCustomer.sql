CREATE PROCEDURE [sales].[deleteCustomer]  
    @first_name  varchar(255),   
    @last_name  varchar(255),  
	@email  varchar(255)
AS   
BEGIN
	DELETE FROM sales.customers
	WHERE 
	first_name = @first_name 
	AND last_name = @last_name 
	AND email = @email
END