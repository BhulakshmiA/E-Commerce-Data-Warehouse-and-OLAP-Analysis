SELECT
    P.category,
    P.product_name,
    SUM(F.quantity) AS total_quantity_sold,
    RANK() OVER (PARTITION BY P.category ORDER BY SUM(F.quantity) DESC) AS quantity_rank_in_category
FROM Sales_Transaction_Fact F
JOIN Product_Dimension P ON F.product_id = P.product_id
GROUP BY P.category, P.product_name
ORDER BY P.category, total_quantity_sold DESC;