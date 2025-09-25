SELECT
    T.year,
    T.month,
    P.category,
    SUM(F.total_amount) AS monthly_category_sales,
    AVG(SUM(F.total_amount)) OVER (PARTITION BY P.category) AS avg_monthly_category_sales
FROM Sales_Transaction_Fact F
JOIN Product_Dimension P ON F.product_id = P.product_id
JOIN Time_Dimension T ON F.date_id = T.date_id
GROUP BY T.year, T.month, P.category
ORDER BY P.category, T.year, T.month;