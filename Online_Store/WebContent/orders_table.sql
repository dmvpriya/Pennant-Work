CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    order_total INT,
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);



-- Insert 10 rows into the orders table
INSERT INTO orders (order_id, order_date, order_total, cust_id) VALUES
(101, '2024-04-28', 5, 1),
(102, '2024-04-27', 1, 1),
(103, '2024-04-26', 7, 3),
(104, '2024-04-25', 3, 3),
(105, '2024-04-24', 1, 4),
(106, '2024-04-23', 9, 2),
(107, '2024-04-22', 6, 3),
(108, '2024-04-21', 8, 2),
(109, '2024-04-20', 4, 4),
(110, '2024-04-19', 2, 1);