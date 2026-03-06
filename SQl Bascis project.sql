
CREATE DATABASE IF NOT EXISTS sales_analysis;
USE sales_analysis;

-- Customers table
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(50)  NOT NULL,
    last_name     VARCHAR(50)  NOT NULL,
    email         VARCHAR(100) UNIQUE,
    city          VARCHAR(50),
    country       VARCHAR(50),
    signup_date   DATE
);

-- Products table
CREATE TABLE products (
    product_id    INT PRIMARY KEY AUTO_INCREMENT,
    product_name  VARCHAR(100) NOT NULL,
    category      VARCHAR(50),
    unit_price    DECIMAL(10,2) NOT NULL,
    stock_qty     INT DEFAULT 0
);

-- Orders table
CREATE TABLE orders (
    order_id      INT PRIMARY KEY AUTO_INCREMENT,
    customer_id   INT,
    order_date    DATE NOT NULL,
    status        VARCHAR(20) DEFAULT 'Completed',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items table (links orders to products)
CREATE TABLE order_items (
    item_id       INT PRIMARY KEY AUTO_INCREMENT,
    order_id      INT,
    product_id    INT,
    quantity      INT NOT NULL,
    unit_price    DECIMAL(10,2) NOT NULL,   -- price at time of sale
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Customers
INSERT INTO customers (first_name, last_name, email, city, country, signup_date) VALUES
('Alice',   'Johnson',  'alice@email.com',   'New York',    'USA',    '2022-01-15'),
('Bob',     'Smith',    'bob@email.com',     'London',      'UK',     '2022-03-22'),
('Clara',   'Davis',    'clara@email.com',   'Toronto',     'Canada', '2022-05-10'),
('David',   'Lee',      'david@email.com',   'Sydney',      'Australia','2022-07-01'),
('Eva',     'Martinez', 'eva@email.com',     'New York',    'USA',    '2022-08-19'),
('Frank',   'Wilson',   'frank@email.com',   'Chicago',     'USA',    '2022-09-05'),
('Grace',   'Taylor',   'grace@email.com',   'London',      'UK',     '2023-01-11'),
('Henry',   'Brown',    'henry@email.com',   'Vancouver',   'Canada', '2023-02-28'),
('Isla',    'Clark',    'isla@email.com',    'Melbourne',   'Australia','2023-04-17'),
('James',   'White',    'james@email.com',   'Houston',     'USA',    '2023-06-23');

-- Products
INSERT INTO products (product_name, category, unit_price, stock_qty) VALUES
('Laptop Pro 15',      'Electronics',  1200.00, 50),
('Wireless Mouse',     'Electronics',    25.00, 200),
('USB-C Hub',          'Electronics',    45.00, 150),
('Standing Desk',      'Furniture',     350.00, 30),
('Ergonomic Chair',    'Furniture',     290.00, 25),
('Notebook Set',       'Stationery',     12.00, 500),
('Ballpoint Pens x10', 'Stationery',      8.00, 600),
('Monitor 27"',        'Electronics',   400.00, 40),
('Desk Lamp',          'Furniture',      55.00, 80),
('Webcam HD',          'Electronics',    90.00, 70);

-- Orders
INSERT INTO orders (customer_id, order_date, status) VALUES
(1,  '2023-01-10', 'Completed'),
(2,  '2023-01-15', 'Completed'),
(3,  '2023-02-02', 'Completed'),
(1,  '2023-02-20', 'Completed'),
(5,  '2023-03-05', 'Completed'),
(4,  '2023-03-18', 'Completed'),
(6,  '2023-04-01', 'Completed'),
(7,  '2023-04-22', 'Completed'),
(2,  '2023-05-10', 'Completed'),
(8,  '2023-05-30', 'Completed'),
(9,  '2023-06-14', 'Completed'),
(10, '2023-06-28', 'Completed'),
(3,  '2023-07-07', 'Completed'),
(5,  '2023-07-19', 'Completed'),
(1,  '2023-08-01', 'Completed'),
(6,  '2023-08-15', 'Completed'),
(4,  '2023-09-03', 'Completed'),
(7,  '2023-09-21', 'Completed'),
(10, '2023-10-05', 'Completed'),
(2,  '2023-10-18', 'Completed'),
(8,  '2023-11-02', 'Completed'),
(9,  '2023-11-20', 'Completed'),
(5,  '2023-12-01', 'Completed'),
(1,  '2023-12-15', 'Completed');

-- Order Items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1,  1, 1, 1200.00), (1,  2, 2,   25.00),
(2,  8, 1,  400.00), (2,  3, 1,   45.00),
(3,  4, 1,  350.00), (3,  9, 1,   55.00),
(4,  5, 1,  290.00),
(5,  2, 3,   25.00), (5,  6, 2,   12.00),
(6,  1, 1, 1200.00), (6, 10, 1,   90.00),
(7,  3, 2,   45.00), (7,  7, 3,    8.00),
(8,  8, 2,  400.00),
(9,  5, 1,  290.00), (9,  9, 2,   55.00),
(10, 1, 1, 1200.00), (10, 2, 1,   25.00),
(11, 4, 1,  350.00),
(12, 6, 5,   12.00), (12, 7, 5,    8.00),
(13, 10,1,   90.00), (13, 3, 1,   45.00),
(14, 1, 2, 1200.00),
(15, 8, 1,  400.00), (15, 2, 2,   25.00),
(16, 5, 1,  290.00),
(17, 9, 3,   55.00), (17, 7, 4,    8.00),
(18, 1, 1, 1200.00),
(19, 4, 1,  350.00), (19, 6, 3,   12.00),
(20, 8, 1,  400.00), (20, 3, 2,   45.00),
(21, 1, 1, 1200.00), (21,10, 1,   90.00),
(22, 2, 4,   25.00), (22, 7, 6,    8.00),
(23, 5, 1,  290.00), (23, 9, 1,   55.00),
(24, 1, 1, 1200.00), (24, 8, 1,  400.00);

-- Q1. View all customers

SELECT 
    *
FROM
    customers;

-- Q2. View all products and their prices
SELECT 
    *
FROM
    products
ORDER BY unit_price DESC;

-- Q3. Find all customers from the USA
SELECT 
    *
FROM
    customers
WHERE
    country = 'USA';

-- Q4. List products that cost more than $100
SELECT 
    *
FROM
    products
WHERE
    unit_price > 100
ORDER BY unit_price DESC;

-- Q5. How many customers do we have per country?
SELECT 
    country, COUNT(*) AS total_customers
FROM
    customers
GROUP BY country
ORDER BY total_customers DESC;
    
-- Q6. Total revenue generated overall
SELECT 
    SUM(quantity * unit_price) AS Total_revenue
FROM
    order_items;
    
-- Q7. Total revenue per product category
SELECT 
    p.category, SUM(oi.quantity * oi.unit_price) AS revenue
FROM
    order_items oi
        JOIN
    products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;
    
-- Q8. Average order value
SELECT 
    ROUND(AVG(order_total), 2) AS avg_order_value
FROM
    (SELECT 
        order_id, SUM(quantity * unit_price) AS order_total
    FROM
        order_items
    GROUP BY order_id) AS orders_total;

-- Q9. Full order details (customer name + products + amounts)
SELECT 
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS line_total,
    o.order_date
FROM
    orders o
        JOIN
    customers c ON o.customer_id = c.customer_id
        JOIN
    order_items oi ON o.order_id = oi.order_id
        JOIN
    products p ON oi.product_id = p.product_id
ORDER BY o.order_date;

-- Q10. Top 5 best-selling products by revenue

SELECT 
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM
    order_items oi
        JOIN
    products p ON oi.product_id = p.product_id
GROUP BY p.product_id , p.product_name , p.category
ORDER BY total_revenue DESC
LIMIT 5;

-- Q11. Revenue per customer (who are our best customers?)
SELECT 
    CONCAT(first_name, ' ', last_name) AS customer_name,
    c.country,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS lifetime_value
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
        JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id , c.first_name , c.last_name , c.country
ORDER BY lifetime_value DESC;

-- Q12. Monthly revenue trend
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue,
    COUNT(DISTINCT o.order_id) AS orders_that_month
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;
    
-- Q13. Which month had the highest revenue?
SELECT 
    DATE_FORMAT(o.order_date, '%y-%m') AS Month,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY monthly_revenue DESC
LIMIT 1;
   
-- Q14. Quarter-over-quarter revenue

SELECT 
    YEAR(o.order_date) AS year,
    QUARTER(o.order_date) AS quarter,
    SUM(oi.quantity * oi.unit_price) AS quarterly_revenue
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY year , quarter
ORDER BY year , quarter;

-- Q15. Customers who have placed more than 1 order (loyal customers)
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS num_of_orders
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.first_name , c.last_name
HAVING num_of_orders > 1
ORDER BY num_of_orders DESC;

-- Q16. Classify customers by spending tier

SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS Customer_Name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    CASE
        WHEN SUM(oi.quantity * oi.unit_price) >= 2000 THEN 'VIP'
        WHEN SUM(oi.quantity * oi.unit_price) >= 1000 THEN 'Regular'
        ELSE 'Occasional'
    END AS Customer_tier
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
        JOIN
    order_items oi ON oi.order_id = o.order_id
GROUP BY c.customer_id , c.first_name , c.last_name
ORDER BY total_revenue DESC;
    
-- Q17. Products that have NEVER been ordered (using LEFT JOIN)

SELECT 
    p.product_name, p.category, p.unit_price
FROM
    products p
        LEFT JOIN
    order_items oi ON p.product_id = oi.product_id
WHERE
    oi.product_id IS NULL;

-- Q18. Products with revenue ABOVE the average product revenue
SELECT 
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS Products_revenue
FROM
    order_items oi
        JOIN
    products P ON oi.product_id = p.product_id
GROUP BY p.product_id , p.product_name
HAVING products_revenue > (SELECT 
        AVG(sub.product_total)
    FROM
        (SELECT 
            SUM(quantity * unit_price) AS product_total
        FROM
            order_items
        GROUP BY product_id) sub)
ORDER BY Products_revenue DESC;
    
-- Q19. Country-level revenue breakdown

SELECT 
    c.country,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    ROUND(AVG(oi.quantity * oi.unit_price), 2) AS avg_item_value
FROM
    customers c
        JOIN
    orders o ON o.customer_id = c.customer_id
        JOIN
    order_items oi ON oi.order_id = o.order_id
GROUP BY c.country
ORDER BY total_revenue DESC;


-- Q20. FINAL DASHBOARD SUMMARY VIEW

SELECT '--- Business Summary ---' AS metric, '' AS value 
UNION ALL SELECT 
    'Total Customers', COUNT(*)
FROM
    customers 
UNION ALL SELECT 
    'Total Orders', COUNT(*)
FROM
    orders 
UNION ALL SELECT 
    'Total Products', COUNT(*)
FROM
    products 
UNION ALL SELECT 
    'Total Revenue ($)', ROUND(SUM(quantity * unit_price), 2)
FROM
    order_items 
UNION ALL SELECT 
    'Average Order Value ($)', ROUND(AVG(t.total), 2)
FROM
    (SELECT 
        SUM(quantity * unit_price) AS total
    FROM
        order_items
    GROUP BY order_id) t 
UNION ALL SELECT 
    'Top Country', country
FROM
    (SELECT 
        c.country, SUM(oi.quantity * oi.unit_price) AS rev
    FROM
        customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.country
    ORDER BY rev DESC
    LIMIT 1) top_country;
