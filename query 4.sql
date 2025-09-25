SELECT
    T.year,
    T.month,
    SUM(F.total_amount) AS current_month_sales,
    LAG(SUM(F.total_amount), 1, 0) OVER (ORDER BY T.year, T.month) AS previous_month_sales,
    (SUM(F.total_amount) - LAG(SUM(F.total_amount), 1, 0) OVER (ORDER BY T.year, T.month)) * 100.0 / LAG(SUM(F.total_amount), 1, 0) OVER (ORDER BY T.year, T.month) AS growth_percentage
FROM Sales_Transaction_Fact F
JOIN Time_Dimension T ON F.date_id = T.date_id
GROUP BY T.year, T.month
ORDER BY T.year, T.month;