# PostgreSQL-F.P.C.T

## Introduction

This task consists of using some of the most important tools when performing complex tasks within a database. We talk about functions, procedures, cursors and triggers.

Each of these is essential for the proper functioning of the system and saves time and improves efficiency in inventory management.
It will be described in detail how each of these tools were implemented and how they were integrated into our Bicyclestore database.

In short, a practical example of how various tools can be used to build efficient and automated database management systems will be represented, all this will be using PostgreSQL.

* Functions: Definition and characteristics of functions, as well as practical examples using the tool. Two functions will be used: get_product_price and get_customer_total_sales.

* Procedures: Definition and characteristics of procedures, as well as practical examples using the tool. Two procedures will be used: add_product and add_sale.

* Cursors: Definition and characteristics of cursors, as well as two practical examples using the tool. 

* Triggers: Definition and characteristics of triggers, as well as another two practical examples using the tool. 


## Instructions
* First step: CREATE DATABASE BicycleStore;
* Second step: use the datababase; \c BicycleStore;
* Third step: inside the Scripts folder use the ddl.sql file to create the tables.
* Fourth step: inside the Scripts folder use the dml.sql file to insert the data.
* Fifth step: inside from the other folders choose the scripts between functions, pocedures, curors or triggers.

### Functions
* get_product_id(funtion1.sql): The first function will allow us to receive the ID of a product as a parameter and returns its price as a decimal number with two decimal places. It will make a query to the Products table.
To call the function we simply make a select with the name of the function and choosing one of the IDs that we have, it all depends on what the function does: **SELECT get_product_price(1);**

* get_customer_total_sales(function2.sql): The second function receives the ID of a customer as a parameter and returns the total number of sales it has made as a decimal number with two decimal places. It will make a query to the Sales table.
To call the function we simply make a select with the name of the function and choosing one of the IDs that we have: **SELECT get_customer_total_sales(4);**

### Procedures
* add_product(procedures1.sql): The first procedure allows you to add a new product by specifying its brand, description, price, and the corresponding vendor ID. It will make a query to the Products table.
We CALL the function to use and put new data: **CALL add_product('Samsung', 'Smarthphone', 499.99, 1);**

After that you can check if the data is in the table: **SELECT * FROM Products;**

* add_sale(procedures2.sql): The second procedure allows you to add a new sale by specifying the customer ID, the ID of the product sold, the date of the sale, the quantity sold, and the total of the sale. It will make a query to the Sales table.

We CALL the function to use and put new data:  **CALL add_sale(1, 2, '2023-04-29', 5, 125.50);**

After that you can check if the data is in the table: **SELECT * FROM Sales;**

### Cursors
* cur_products(cursor1.sql): The first cursor will be in charge of consulting the products associated with a specific supplier and will show their ID, brand, description and price.

Replace the numeber with the vendor ID you want to query.

*cur_sales(cursor2.sql): The second cursor loops through the records in the **Sales** table that correspond to a specific customer to select all sales where the customer ID equals the value of the p_customer_id parameter, the parameter value is specified, a loop is started to get the first record and assign it, otherwise it exits.

Replace the number with the client ID you want to query.

### Triggers

* tr_update_inventory(trigger1.sql): The first trigger uses the Inventory table and when a new insert is executed in the Sales table, the trigger fires and executes the function update_inventory_after_sale().
Which will update the Inventory table by subtracting the quantity of products sold from the quantity available in inventory, and it does so for the specific product that has been sold, identified by its product_id.

Example to add: **INSERT INTO Sales (customer_id, product_id, date, quantity, total) VALUES (3, 4, '2023-05-03', 1, 3000.00);**

Show the new data: **SELECT * FROM inventory;**

* tr_record_exit_date(trigger2.sql): The second trigger is executed after an update is made to the Inventory table and checks if the quantity of a product has decreased to zero after the update.
If it is zero after the update, then the release date is recorded in the Inventory table for that product.

Example to add: **INSERT INTO Inventory (product_id, quantity) VALUES (12, 5);**

Verify if the data is in the inventory: **SELECT * FROM Inventory WHERE product_id = 12;**

Update the data to 0: **UPDATE Inventory SET quantity = 0 WHERE product_id = 12;**

Select the data to watch if the exit_date is updated with the trigger: **SELECT * FROM Inventory;**

### Webgraphy

https://codeandwork.github.io/courses/cs/sp_cursors_triggers_indexes.html

https://infocenter.sybase.com/help/index.jsp?topic=/com.sybase.help.sqlanywhere.12.0.1/dbusage/ptuc.html


