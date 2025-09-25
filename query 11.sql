SELECT
    T1.year,
    SUM(F1.total_amount) AS current_year_sales,
    LAG(SUM(F1.total_amount), 1, 0) OVER (ORDER BY T1.year) AS previous_year_sales,
    (SUM(F1.total_amount) - LAG(SUM(F1.total_amount), 1, 0) OVER (ORDER BY T1.year)) * 100.0 / NULLIF(LAG(SUM(F1.total_amount), 1, 0) OVER (ORDER BY T1.year), 0) AS growth_percentage
FROM Sales_Transaction_Fact F1
JOIN Time_Dimension T1 ON F1.date_id = T1.date_id
GROUP BY T1.year
ORDER BY T1.year;