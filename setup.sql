-- CREATE

CREATE TABLE customers (
  customer_id int PRIMARY KEY,
  last_name varchar(255) NOT NULL,
  first_name varchar(255),
  address varchar(255),
  postcode varchar(255),
  city varchar(255),
  country varchar(255)
);

CREATE TABLE shipping_services (
  shipping_id int PRIMARY KEY,
  shipping_name varchar(255),
  country varchar(255),
  cost_per_mile float
);

CREATE TABLE products (
  product_id int PRIMARY KEY,
  product_name varchar(255),
  product_desc varchar(255),
  price float
);

CREATE TABLE orders (
  order_id int PRIMARY KEY,
  order_datetime DATETIME,
  quantity int,
  product_id int,
  customer_id int,
  FOREIGN KEY (product_id)
  REFERENCES products(product_id),
  FOREIGN KEY (customer_id)
  REFERENCES customers(customer_id)
);

CREATE TABLE shipping_order (
  shipping_order_id int PRIMARY KEY,
  distance_miles float,
  order_id int,
  customer_id int,
  shipping_id int,
  FOREIGN KEY (order_id)
  REFERENCES orders(order_id),
  FOREIGN KEY (customer_id)
  REFERENCES customers(customer_id),
  FOREIGN KEY (shipping_id)
  REFERENCES shipping_services(shipping_id)
);

-- INSERT

INSERT INTO customers
(customer_id, last_name, first_name, address, postcode, city, country)
VALUES
(1, 'Smith', 'John', '12 High Street', 'SW1A 1AA', 'London', 'United Kingdom'),
(2, 'Johnson', 'Emily', '45 Oxford Road', 'M1 5QA', 'Manchester', 'United Kingdom'),
(3, 'Brown', 'Oliver', '8 King Street', 'B1 1AA', 'Birmingham', 'United Kingdom'),
(4, 'Taylor', 'Sophia', '23 Princes Street', 'EH2 2ER', 'Edinburgh', 'United Kingdom'),
(5, 'Wilson', 'James', '17 Park Lane', 'L1 8JQ', 'Liverpool', 'United Kingdom'),
(6, 'Muller', 'Anna', '10 Hauptstrasse', '10115', 'Berlin', 'Germany'),
(7, 'Martin', 'Lucas', '22 Rue de Rivoli', '75001', 'Paris', 'France'),
(8, 'Rossi', 'Giulia', '5 Via Roma', '00184', 'Rome', 'Italy'),
(9, 'Garcia', 'Sofia', '14 Gran Via', '28013', 'Madrid', 'Spain'),
(10, 'Anderson', 'William', '30 Queen Street', 'G1 3DS', 'Glasgow', 'United Kingdom');


INSERT INTO shipping_services
(shipping_id, shipping_name, country, cost_per_mile)
VALUES
(1, 'Standard Delivery', 'United Kingdom', 0.50),
(2, 'Express Delivery', 'United Kingdom', 0.85),
(3, 'International Standard', 'Germany', 1.20),
(4, 'International Express', 'France', 1.75),
(5, 'Economy International', 'Italy', 1.00),
(6, 'Premium International', 'Spain', 2.00);


INSERT INTO products
(product_id, product_name, product_desc, price)
VALUES
(1, 'Laptop', '15-inch laptop with 16GB RAM', 799.99),
(2, 'Smartphone', '128GB smartphone with OLED display', 599.99),
(3, 'Wireless Headphones', 'Bluetooth over-ear headphones', 89.99),
(4, 'Mechanical Keyboard', 'RGB mechanical gaming keyboard', 69.99),
(5, 'Computer Mouse', 'Wireless optical mouse', 24.99),
(6, 'Monitor', '27-inch 4K computer monitor', 249.99),
(7, 'Tablet', '10-inch touchscreen tablet', 329.99),
(8, 'USB-C Hub', 'Multiport USB-C adapter', 39.99),
(9, 'Webcam', '1080p HD webcam', 49.99),
(10, 'External SSD', '1TB portable solid-state drive', 99.99);



INSERT INTO orders
(order_id, order_datetime, quantity, product_id, customer_id)
VALUES
(1001, '2026-09-01 10:15:00', 1, 1, 1),
(1002, '2026-09-02 11:30:00', 2, 3, 2),
(1003, '2026-09-03 14:20:00', 1, 2, 3),
(1004, '2026-09-04 09:45:00', 3, 5, 4),
(1005, '2026-09-05 16:10:00', 1, 6, 5),
(1006, '2026-09-06 12:00:00', 2, 4, 6),
(1007, '2026-09-07 13:25:00', 1, 7, 7),
(1008, '2026-09-08 15:40:00', 4, 8, 8),
(1009, '2026-09-09 08:50:00', 2, 9, 9),
(1010, '2026-09-10 17:05:00', 1, 10, 10),
(1011, '2026-09-11 10:30:00', 2, 2, 1),
(1012, '2026-09-12 14:15:00', 1, 3, 5),
(1013, '2026-09-13 11:20:00', 2, 1, 7),
(1014, '2026-09-14 16:45:00', 1, 5, 3),
(1015, '2026-09-15 09:10:00', 3, 8, 2),
(1016, '2026-09-16 09:15:00', 1, 3, 4),
(1017, '2026-09-16 10:30:00', 2, 5, 1),
(1018, '2026-09-17 11:45:00', 1, 6, 8),
(1019, '2026-09-17 13:20:00', 3, 8, 3),
(1020, '2026-09-18 14:10:00', 1, 1, 6),
(1021, '2026-09-18 15:35:00', 2, 9, 2),
(1022, '2026-09-19 08:50:00', 1, 4, 9),
(1023, '2026-09-19 12:25:00', 4, 5, 10),
(1024, '2026-09-20 10:00:00', 1, 7, 5),
(1025, '2026-09-20 16:40:00', 2, 2, 7),
(1026, '2026-09-21 09:30:00', 1, 10, 1),
(1027, '2026-09-21 11:15:00', 3, 3, 6),
(1028, '2026-09-22 13:50:00', 2, 6, 4),
(1029, '2026-09-22 15:05:00', 1, 8, 8),
(1030, '2026-09-23 10:20:00', 2, 1, 2),
(1031, '2026-09-23 14:45:00', 1, 9, 3),
(1032, '2026-09-24 09:10:00', 5, 5, 7),
(1033, '2026-09-24 12:35:00', 1, 4, 5),
(1034, '2026-09-25 16:15:00', 2, 7, 10),
(1035, '2026-09-25 17:30:00', 1, 2, 9);


INSERT INTO shipping_order
(shipping_order_id, distance_miles, order_id, customer_id, shipping_id)
VALUES
(1, 10.5, 1001, 1, 1),
(2, 15.2, 1002, 2, 1),
(3, 8.7, 1003, 3, 2),
(4, 12.0, 1004, 4, 1),
(5, 20.5, 1005, 5, 2),
(6, 450.0, 1006, 6, 3),
(7, 340.0, 1007, 7, 4),
(8, 720.0, 1008, 8, 5),
(9, 850.0, 1009, 9, 6),
(10, 25.0, 1010, 10, 1),
(11, 11.0, 1011, 1, 1),
(12, 18.5, 1012, 5, 2),
(13, 500.0, 1013, 7, 4),
(14, 9.5, 1014, 3, 2),
(15, 16.0, 1015, 2, 1),
(16, 14.2, 1016, 4, 2),
(17, 7.5, 1017, 1, 1),
(18, 22.0, 1018, 8, 5),
(19, 11.8, 1019, 3, 2),
(20, 35.5, 1020, 6, 3),
(21, 16.4, 1021, 2, 1),
(22, 28.0, 1022, 9, 4),
(23, 9.3, 1023, 10, 1),
(24, 19.6, 1024, 5, 2),
(25, 42.0, 1025, 7, 4),
(26, 8.2, 1026, 1, 1),
(27, 31.5, 1027, 6, 3),
(28, 13.7, 1028, 4, 2),
(29, 24.5, 1029, 8, 5),
(30, 17.0, 1030, 2, 1),
(31, 10.8, 1031, 3, 2),
(32, 6.9, 1032, 7, 4),
(33, 21.3, 1033, 5, 2),
(34, 12.5, 1034, 10, 1),
(35, 38.0, 1035, 9, 6);

-- EXAMPLE QUERY

SELECT 
  c.first_name,
  c.last_name,
  p.product_name,
  c.country
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
ORDER BY c.last_name ASC;

