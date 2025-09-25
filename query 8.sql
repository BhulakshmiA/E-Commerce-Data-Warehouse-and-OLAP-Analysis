SELECT
    F.payment_method,
    SUM(F.total_amount) AS payment_method_sales,
    (SUM(F.total_amount) * 100.0 / SUM(SUM(F.total_amount)) OVER ()) AS percentage_of_total_sales
FROM Sales_Transaction_Fact F
GROUP BY F.payment_method
ORDER BY payment_method_sales DESC;