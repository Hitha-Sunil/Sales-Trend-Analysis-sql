Create table for online sales
CREATE TABLE online_sales (
    order_id     INTEGER,
    order_date   DATE,
    amount       REAL,
    product_id   INTEGER
);

-- Insert sample orders (Jan – Apr 2023)
INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2023-01-05', 250.00, 101),
(2, '2023-01-10', 300.00, 102),
(3, '2023-01-15', 150.00, 103),
(4, '2023-02-01', 400.00, 101),
(5, '2023-02-12', 600.00, 104),
(6, '2023-02-20', 200.00, 102),
(7, '2023-03-03', 350.00, 105),
(8, '2023-03-10', 500.00, 101),
(9, '2023-03-18', 450.00, 106),
(10, '2023-04-02', 700.00, 102),
(11, '2023-04-15', 300.00, 107),
(12, '2023-04-20', 500.00, 104);

-- Task 6: Sales Trend Analysis Using Aggregations (SQLite)

SELECT
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales
-- Optional: limit to 2023 only
WHERE
    order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
    year, month
ORDER BY
    year, month;

SELECT
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    AVG(amount) AS avg_order_value
FROM
    online_sales
GROUP BY
    year, month
ORDER BY
    year, month;

SELECT
    product_id,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    online_sales
GROUP BY
    product_id
ORDER BY
    total_revenue DESC;

SELECT
    strftime('%Y', order_date) AS year,
    strftime('%m', order_date) AS month,
    SUM(amount) AS total_revenue
FROM
    online_sales
GROUP BY
    year, month
ORDER BY
    total_revenue DESC
LIMIT 3;





