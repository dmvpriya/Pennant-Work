CREATE TABLE customers (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(255),
    cust_mobile_no VARCHAR(15),
    cust_location VARCHAR(255),
    cust_order_date DATE,
    cust_username VARCHAR(50),
    cust_password VARCHAR(50)
);


INSERT INTO customers (cust_id, cust_name, cust_mobile_no, cust_location, cust_order_date, cust_username, cust_password) VALUES
(1, 'John Doe', '1234567890', 'Vizag', '2024-04-28', 'john123', 'password123'),
(2, 'Jane Smith', '9876543210', 'Vijayawada', '2024-04-27', 'jane456', 'password456'),
(3, 'Michael Johnson', '7890123456', 'Nellore', '2024-04-26', 'michael789', 'password789'),
(4, 'Emily Brown', '5678901234', 'Rajamundry', '2024-04-25', 'emily012', 'password012'),
(5, 'David Wilson', '4567890123', 'Ongole', '2024-04-24', 'david345', 'password345'),
(6, 'Emma Jones', '2345678901', 'Srikakulam', '2024-04-23', 'emma678', 'password678'),
(7, 'Christopher Lee', '3456789012', 'Tirupathy', '2024-04-22', 'chris901', 'password901'),
(8, 'Olivia Taylor', '6789012345', 'Vizag', '2024-04-21', 'olivia234', 'password234'),
(9, 'Daniel Clark', '8901234567', 'Rajamundry', '2024-04-20', 'daniel567', 'password567'),
(10, 'Sophia Martinez', '0123456789', 'Tirupathy', '2024-04-19', 'sophia890', 'password890');
