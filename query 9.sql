SELECT
    L.shopping_mall,
    P.product_name,
    SUM(F.total_amount) AS total_sales,
    ROW_NUMBER() OVER (PARTITION BY L.shopping_mall ORDER BY SUM(F.total_amount) DESC) AS rn
FROM Sales_Transaction_Fact F
JOIN Location_Dimension L ON F.mall_id = L.mall_id
JOIN Product_Dimension P ON F.product_id = P.product_id
GROUP BY L.shopping_mall, P.product_name
ORDER BY L.shopping_mall, total_sales DESC;