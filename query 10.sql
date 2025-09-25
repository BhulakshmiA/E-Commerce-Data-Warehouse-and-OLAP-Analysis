SELECT
    C.customer_id,
    C.customer_name,
    F.invoice_no,
    F.total_amount
FROM Sales_Transaction_Fact F
JOIN Customer_Dimension C ON F.customer_id = C.customer_id
WHERE F.total_amount > 1000
ORDER BY F.total_amount DESC;