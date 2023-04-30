-- Cursor to list all sales for a specific customer
DO $$
DECLARE
    cur_sales CURSOR(p_customer_id INT) FOR
        SELECT * FROM Sales WHERE customer_id = p_customer_id;
    rec_sale RECORD;
BEGIN
    OPEN cur_sales(2); -- Replace the number 2 with the client ID you want to query
    LOOP
        FETCH cur_sales INTO rec_sale;
        EXIT WHEN NOT FOUND;
        RAISE NOTICE 'ID: %, Cliente: %, Producto: %, Fecha: %, Cantidad: %, Total: %', rec_sale.id, rec_sale.customer_id, rec_sale.product_id, rec_sale.date, rec_sale.quantity, rec_sale.total;
    END LOOP;
    CLOSE cur_sales;
END;
$$ LANGUAGE plpgsql;