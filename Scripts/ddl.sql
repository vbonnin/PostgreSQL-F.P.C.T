-- First step create database
CREATE DATABASE BicycleStore;

-- Second step use the database
\c BicycleStore;

-- Third step create tables
CREATE TABLE Products (
    id SERIAL PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10, 2) NOT NULL,
    supplier_id INT,
    image BYTEA
);
CREATE TABLE Sales (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    date DATE NOT NULL,
    quantity INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL
);
CREATE TABLE Customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255)
);
CREATE TABLE Suppliers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255)
);
CREATE TABLE Inventory (
    id SERIAL PRIMARY KEY,
    product_id INT,
    quantity INT NOT NULL,
    entry_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    exit_date TIMESTAMP
);
ALTER TABLE Products
ADD CONSTRAINT fk_products_suppliers
FOREIGN KEY (supplier_id) REFERENCES Suppliers(id)
ON UPDATE CASCADE
ON DELETE SET NULL;

ALTER TABLE Sales
ADD CONSTRAINT fk_sales_customers
FOREIGN KEY (customer_id) REFERENCES Customers(id)
ON UPDATE CASCADE
ON DELETE SET NULL;

ALTER TABLE Sales
ADD CONSTRAINT fk_sales_products
FOREIGN KEY (product_id) REFERENCES Products(id)
ON UPDATE CASCADE
ON DELETE SET NULL;

ALTER TABLE Inventory
ADD CONSTRAINT fk_inventory_products
FOREIGN KEY (product_id) REFERENCES Products(id)
ON UPDATE CASCADE
ON DELETE CASCADE;
