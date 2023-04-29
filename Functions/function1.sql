-- Function to get the price of a product by the ID
-- Use select get_product_price(number of the product ID)
CREATE OR REPLACE FUNCTION get_product_price(p_product_id INT)
RETURNS DECIMAL(10, 2) AS $$
DECLARE
    product_price DECIMAL(10, 2);
BEGIN
    SELECT price INTO product_price FROM Products WHERE id = p_product_id;
    RETURN product_price;
END;
$$ LANGUAGE plpgsql;