-- Procedure to add a Sale
-- Example: CALL add_sale(1, 2, '2023-04-29', 5, 125.50);
-- Show the result: SELECT * FROM Sales;
CREATE OR REPLACE PROCEDURE add_sale(p_customer_id INT, p_product_id INT, p_date DATE, p_quantity INT, p_total DECIMAL(10, 2))
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO Sales (customer_id, product_id, date, quantity, total) VALUES (p_customer_id, p_product_id, p_date, p_quantity, p_total);
END;
$$;