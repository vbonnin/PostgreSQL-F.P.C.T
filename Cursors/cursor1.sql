-- Cursor to list all products from a specific supplier
DO $$
DECLARE
    cur_products CURSOR(p_supplier_id INT) FOR
        SELECT * FROM Products WHERE supplier_id = p_supplier_id;
    rec_product RECORD;
BEGIN
    OPEN cur_products(1); -- Replace the numeber 1 with the vendor ID you want to query
    LOOP
        FETCH cur_products INTO rec_product;
        EXIT WHEN NOT FOUND;
        RAISE NOTICE 'ID: %, Marca: %, Descripción: %, Precio: %', rec_product.id, rec_product.brand, rec_product.description, rec_product.price;
    END LOOP;
    CLOSE cur_products;
END;
$$ LANGUAGE plpgsql;