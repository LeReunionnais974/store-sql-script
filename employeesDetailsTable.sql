CREATE FUNCTION [sales].[employeesDetailsTable](@store_id AS INT)

RETURNS VARCHAR (max)
AS
BEGIN

DECLARE @result varchar(max)


	SELECT @result = 

	CONCAT('<table>', STRING_AGG(CONCAT(a.first_name, a.last_name, a.email), ''), '</table>') 

	FROM (
		SELECT
			CONCAT(
				'<tr><td>',
				b.first_name
				) AS first_name,
			CONCAT(
				'</td><td>',
				b.last_name
				) AS last_name,
			CONCAT(
				'</td><td>',
				b.email,
				'</td></tr>'
				) AS email,
			store_id
		FROM 
		sales.staffs b
	) AS a

LEFT JOIN sales.stores c
ON (a.store_id = c.store_id)
WHERE a.store_id = @store_id
GROUP BY c.store_name

RETURN @result

END