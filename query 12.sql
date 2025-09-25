SELECT
    C.customer_id,
    C.customer_name,
    MIN(T.invoice_date) AS first_purchase_date
FROM Sales_Transaction_Fact F
JOIN Customer_Dimension C ON F.customer_id = C.customer_id
JOIN Time_Dimension T ON F.date_id = T.date_id
GROUP BY C.customer_id, C.customer_name
ORDER BY first_purchase_date;