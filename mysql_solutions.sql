-- Solutions (MySQL)

-- What are the descriptions of the products bought by every customer?
SELECT
  c.first_name,
  c.last_name,
  p.product_desc
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
ORDER BY c.last_name ASC;

-- How many customers are in each country?
SELECT
  country,
  COUNT(country) AS count
FROM customers
GROUP BY country;

-- What is the total each customer has spent?
SELECT
  c.first_name,
  c.last_name,
  SUM(p.price * o.quantity) AS total
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.last_name, c.first_name;

-- What is the average amount spent by customers on shipping?
SELECT 
  c.customer_id,
  AVG(s.cost_per_mile * so.distance_miles) as shipping
FROM customers c
JOIN shipping_order so ON c.customer_id = so.customer_id
JOIN shipping_services s ON so.shipping_id = s.shipping_id
GROUP BY c.customer_id;

-- What is the most popular shipping service?
SELECT
  ss.shipping_name,
  COUNT(so.shipping_id) AS count
FROM shipping_services ss
JOIN shipping_order so ON ss.shipping_id = so.shipping_id
GROUP BY ss.shipping_name;

-- How many times was the tablet bought?
SELECT
  p.product_name,
  SUM(o.quantity) AS count
FROM products p
JOIN orders o ON p.product_id = o.product_id
WHERE p.product_id = 7
GROUP BY p.product_name;

-- What is the average shipping distance?
SELECT
  AVG(distance_miles) as avg_dist
FROM shipping_order;

-- How many orders are made on each weekday?
SELECT
  DAYNAME(order_datetime) AS week_day,
  SUM(quantity) AS count
FROM orders o
GROUP BY week_day
ORDER BY count DESC;

-- Which products made the most money?
SELECT
  p.product_name,
  SUM(p.price * o.quantity) AS money_made
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY money_made DESC
LIMIT 3;

-- If all orders made on Saturdays had a 20% discount, how would that change the amount made?

SELECT
  DAYNAME(o.order_datetime) AS week_day,
  SUM((o.quantity * p.price) - ((o.quantity * p.price) * 0.8)) AS diff
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE DAYNAME(o.order_datetime) = 'Saturday'
GROUP BY week_day;
