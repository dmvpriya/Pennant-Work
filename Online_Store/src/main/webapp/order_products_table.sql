CREATE TABLE order_products (
    order_id INT,
    product_id varchar(10),
    order_quantity INT,
    order_price INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(prod_id)
);


INSERT INTO order_products (order_id, product_id, order_quantity, order_price) VALUES
(101, 'A1', 2, 500),   -- Order 101: 2 Apples for 500
(101, 'A3', 1, 40),    -- Order 101: 1 Milk for 40
(102, 'A2', 3, 300),   -- Order 102: 3 Bananas for 300
(102, 'A4', 2, 60),    -- Order 102: 2 Breads for 60
(103, 'A5', 1, 120),   -- Order 103: 1 Eggs for 120
(103, 'A7', 4, 360),   -- Order 103: 4 Potatoes for 360
(104, 'A6', 2, 140),   -- Order 104: 2 Tomatoes for 140
(105, 'A9', 3, 360),   -- Order 105: 3 Carrots for 360
(106, 'A1', 1, 250),   -- Order 106: 1 Apple for 250
(106, 'A8', 2, 180);   -- Order 106: 2 Onions for 180
