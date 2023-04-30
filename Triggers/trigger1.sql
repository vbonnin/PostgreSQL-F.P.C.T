-- Trigger to update inventory after adding a sale

-- First step add the trigger

-- Example to add the inventory: INSERT INTO Sales (customer_id, product_id, date, quantity, total)
-- VALUES (3, 4, '2023-05-03', 1, 3000.00);

-- Show the new data: SELECT * FROM inventory;
CREATE OR REPLACE FUNCTION update_inventory_after_sale()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Inventory SET quantity = quantity - NEW.quantity WHERE product_id = NEW.product_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_update_inventory
AFTER INSERT ON Sales
FOR EACH ROW
EXECUTE FUNCTION update_inventory_after_sale();