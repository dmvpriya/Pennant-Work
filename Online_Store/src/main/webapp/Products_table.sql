CREATE TABLE products (
    prod_id INT PRIMARY KEY,
    prod_name VARCHAR(20),
    prod_price INT,
    prod_gst INT,
    prod_image VARCHAR(255), -- Assuming the image path will be stored as a string
    prod_category_id INT,
	Foreign key (prod_category_id) references products_category(prod_category_id)
);

drop table products;

INSERT INTO products (prod_id, prod_name, prod_price, prod_gst, prod_image, prod_category_id) VALUES
(1, 'Apple', 250, 25, 'https://t4.ftcdn.net/jpg/00/59/96/75/360_F_59967553_9g2bvhTZf18zCmEVWcKigEoevGzFqXzq.jpg', 1),
(2, 'Banana', 100, 10, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIovVtm2qKmLCr_xhgu3yXxByz_nmineYwuHLUl11Q5Q&s', 1),
(3, 'Milk', 40, 4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh5hyodmiHiWY-HT9T13gWn3pWeDdE21kPeUaqRP-21P0jhkPLiu9f-SIe8dwFjVDbgpQ&usqp=CAU', 2),
(4, 'Bread', 30, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfwNlZSEbVuH4PoJsG02aTyMRv0rlT6eRsz4iy6LSptXxULUSQ1UIV8Sdb5dUcs5y_MJc&usqp=CAU', 2),
(5, 'Eggs', 120, 12, 'https://images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-eggs-1296x728-feature.jpg', 3),
(6, 'Tomato', 70, 7, 'https://edentreegh.com/wp-content/uploads/2020/12/Green-House-Tomatoes.jpeg', 4),
(7, 'Potato', 90, 9, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTlnKuTYrMIzx7jM7ov9m_sszbLOlGM2VqB5IrldxIEoCpZS-Ia8a6RhP8pUKhQyPjJrM&usqp=CAU', 4),
(8, 'Onion', 50, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo5OwEF3nrSX6Hy3hKdy0zZUDFKi1EYQqrk_G3vCWZMjN_tWrY8dt5CoJrVYNambnwNZg&usqp=CAU', 4),
(9, 'Carrot', 120, 12, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf9MdaCbeixwIkkH8pu21xR5PyyRK_unuDKKW7mLtahA&s', 4),
(10, 'Orange', 200, 20, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnRoleAltBcWrWZ5kpgcjNmpHmE4rbbwKP27SjjSgM26yYKl4X55zM4dLj3L6L4M_EBB4&usqp=CAU', 1);