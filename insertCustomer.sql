CREATE PROCEDURE [sales].[insertCustomer]  
    @first_name  varchar(255),   
    @last_name  varchar(255),   
    @phone varchar(25),
	@email  varchar(255),
	@street  varchar(255),
	@city  varchar(50),
	@state varchar(25),
	@zip_code  varchar(5)
AS   
BEGIN
	INSERT INTO sales.customers (first_name, last_name, phone, email, street, city, state, zip_code) 
	VALUES (@first_name, @last_name, @phone, @email, @street, @city, @state, @zip_code)
END

