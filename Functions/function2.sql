-- Function to calculate a customer's total sales by their ID
-- select get_customer_total_sales(number of customer ID);
CREATE OR REPLACE FUNCTION get_customer_total_sales(p_customer_id INT)
RETURNS DECIMAL(10, 2) AS $$
DECLARE
    customer_total_sales DECIMAL(10, 2);
BEGIN
    SELECT SUM(total) INTO customer_total_sales FROM Sales WHERE customer_id = p_customer_id;
    RETURN customer_total_sales;
END;
$$ LANGUAGE plpgsql;