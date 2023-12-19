CREATE PROCEDURE sales.insertStore   
    @store_name  varchar(255),   
    @phone varchar(25),
	@email  varchar(255),
	@street  varchar(255),
	@city  varchar(255),
	@state varchar(10),
	@zip_code  varchar(5)
AS   
BEGIN
	INSERT INTO sales.stores (store_name,phone,email,street,city,state,zip_code) 
	VALUES (@store_name,@phone,@email,@street,@city,@state,@zip_code)
END
