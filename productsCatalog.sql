CREATE VIEW production.productsCatalog    
AS  
SELECT 
  brands.brand_name,
  brands.brand_id,
  categories.category_id,
  categories.category_name,  
  products.product_id,
  products.product_name,
  products.model_year
FROM production.brands
LEFT JOIN production.products 
    ON (products.brand_id = brands.brand_id)
LEFT JOIN production.categories 
    ON (products.category_id = categories.category_id)
