CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY(order_id, product_id)
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    rating INT
);

SELECT p.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC;

SELECT MONTH(order_date) AS month,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY MONTH(order_date);

SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

SELECT product_id, AVG(rating) AS avg_rating
FROM reviews
GROUP BY product_id;


INSERT INTO customers (name) VALUES
('Rutuja'),
('Aditi'),
('Sanjana'),
('Saiyyami');

INSERT INTO products (name, price) VALUES
('Laptop',60000),
('Phone',30000),
('Headphones',2000),
('Keyboard',1500);

INSERT INTO orders (customer_id, order_date) VALUES
(1,'2024-01-10'),
(2,'2024-01-12'),
(1,'2024-02-05'),
(3,'2024-02-15'),
(4,'2024-03-01');

INSERT INTO order_items VALUES
(1,1,1),
(1,3,2),
(2,2,1),
(3,1,1),
(3,4,1),
(4,3,3),
(5,2,2);


INSERT INTO reviews (product_id, rating) VALUES
(1,5),
(1,4),
(2,3),
(3,4),
(3,5),
(4,3);
