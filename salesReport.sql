CREATE PROCEDURE sales.salesReport  
    @start date,   
    @end date   
AS   

   SELECT
	date_range.date,
	vente.order_date,
	vente.store_id,
	vente.store_name,
	sales.calculSumOrderStoreDate(vente.store_id,vente.order_date)
	FROM(
	    SELECT DATEADD(DAY, nbr - 1, @start) as date
	    FROM ( SELECT    ROW_NUMBER() OVER ( ORDER BY c.object_id ) AS Nbr
			  FROM      sys.columns c
		) nbrs
	WHERE   nbr - 1 <= DATEDIFF(DAY, @start, @end)
	) as date_range
	LEFT JOIN (
		SELECT 
		  orders.order_date,
		  orders.store_id,
		  stores.store_name
		FROM sales.orders
		LEFT JOIN sales.stores ON (stores.store_id=orders.store_id)
		GROUP BY 
		    orders.order_date,
		    orders.store_id,
		    stores.store_name
	) AS sales ON (sales.order_date=date_range.date)
	RETURN
GO
