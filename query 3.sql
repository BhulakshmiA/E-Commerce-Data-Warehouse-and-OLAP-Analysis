SELECT
    L.shopping_mall,
    SUM(F.total_amount) AS total_sales,
    RANK() OVER (ORDER BY SUM(F.total_amount) DESC) AS sales_rank
FROM Sales_Transaction_Fact F
JOIN Location_Dimension L ON F.mall_id = L.mall_id
GROUP BY L.shopping_mall
ORDER BY sales_rank
LIMIT 3;