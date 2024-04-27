CREATE TABLE products (
product_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(255),
category VARCHAR(255),
price DECIMAL(10, 2)
);
CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255),
email VARCHAR(255),
phone VARCHAR(20)
);
CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
order_date DATE,

2

total_amount DECIMAL(10, 2),
FOREIGN KEY (customer_id) REFERENCES test.customers(customer_id)
);
CREATE TABLE order_details (
order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
unit_price DECIMAL(10, 2),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_name, category, price) VALUES
('T-Shirt', 'Clothing', 19.99),
('Jeans', 'Clothing', 39.99),
('Sneakers', 'Footwear', 59.99),
('Backpack', 'Accessories', 29.99),
('Dress Shirt', 'Clothing', 29.99),
('Shorts', 'Clothing', 24.99),
('Boots', 'Footwear', 79.99),
('Hat', 'Accessories', 14.99),
('Jacket', 'Clothing', 69.99),
('Socks', 'Accessories', 9.99);
INSERT INTO customers (name, email, phone) VALUES
('John Doe', 'john@example.com', '123-456-7890'),
('Jane Smith', 'jane@example.com', '987-654-3210'),
('Alice Johnson', 'alice@example.com', '555-555-5555'),
('Michael Brown', 'michael@example.com', '333-333-3333'),
('Emily Davis', 'emily@example.com', '777-777-7777'),
('William Wilson', 'william@example.com', '444-444-4444'),
('Emma Taylor', 'emma@example.com', '666-666-6666'),
('James Jones', 'james@example.com', '222-222-2222'),
('Olivia Martinez', 'olivia@example.com', '888-888-8888'),
('Liam Moore', 'liam@example.com', '999-999-9999');
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2023-01-15', 39.98),
(2, '2023-02-20', 119.97),
(3, '2023-03-25', 179.96),
(4, '2023-04-10', 99.97),
(5, '2023-05-05', 29.99),
(6, '2023-06-15', 119.96),
(7, '2023-07-20', 169.97),

3

(8, '2023-08-30', 49.99),
(9, '2023-09-05', 149.95),
(10, '2023-10-10', 79.98);
INSERT INTO order_details (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 19.99),
(2, 2, 1, 39.99),
(2, 3, 1, 59.99),
(3, 2, 2, 39.99),
(3, 4, 1, 29.99),
(4, 5, 1, 29.99),
(4, 6, 1, 24.99),
(5, 7, 1, 79.99),
(6, 8, 2, 14.99),
(7, 9, 1, 69.99);
SELECT 
    p.category,
    SUM(od.quantity * od.unit_price) AS total_revenue
FROM 
    orders o
JOIN 
    order_details od ON o.order_id = od.order_id
JOIN 
    products p ON od.product_id = p.product_id
WHERE 
    YEAR(o.order_date) = 2023
GROUP BY 
    p.category
ORDER BY 
    total_revenue DESC
LIMIT 3;