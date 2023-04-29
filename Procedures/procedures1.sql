-- Procedure to add a Product
-- Example: CALL add_product('Samsung', 'Smarthphone', 499.99, 1);
-- Show the results: SELECT * FROM Products;
CREATE OR REPLACE PROCEDURE add_product(p_brand VARCHAR(100), p_description VARCHAR(255), p_price DECIMAL(10, 2), p_supplier_id INT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO Products (brand, description, price, supplier_id) VALUES (p_brand, p_description, p_price, p_supplier_id);
END;
$$;