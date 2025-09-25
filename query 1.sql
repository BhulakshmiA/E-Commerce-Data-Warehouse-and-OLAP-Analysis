SELECT
    C.gender,
    F.payment_method,
    SUM(F.total_amount) AS total_sales
FROM Sales_Transaction_Fact F
JOIN Customer_Dimension C ON F.customer_id = C.customer_id
GROUP BY C.gender, F.payment_method
ORDER BY C.gender, F.payment_method;