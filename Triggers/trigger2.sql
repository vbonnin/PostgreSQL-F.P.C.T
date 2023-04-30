-- Trigger to record the departure date in inventory when the quantity decreased to zero

-- First step add the trigger

-- Example: add data: INSERT INTO Inventory (product_id, quantity)
-- VALUES (12, 5);
-- Verify if the data is in the inventory: SELECT * FROM Inventory WHERE product_id = 12;
-- Update the data to 0: UPDATE Inventory SET quantity = 0 WHERE product_id = 12;
-- Select the data to watch if the exit_date is updated with the trigger: SELECT * FROM Inventory;

CREATE OR REPLACE FUNCTION record_exit_date()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.quantity = 0 THEN
        UPDATE Inventory SET exit_date = NOW() WHERE product_id = NEW.product_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_record_exit_date
AFTER UPDATE ON Inventory
FOR EACH ROW
WHEN (OLD.quantity > 0 AND NEW.quantity = 0)
EXECUTE FUNCTION record_exit_date();