-- Restaurant Owners
-- 5 tables
-- 1x Fact, 4x Dimension
-- how to add foreign key
-- write 3-5 SQL queries to analyze data
-- 1x subquery/ with

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  menu_id INT REFERENCES menu (menu_id),
  salesperson_id INT REFERENCES salespersons (salesperson_id),
  location_id INT REFERENCES locations (location_id),
  payment_id INT REFERENCES payments (payment_id),
  quantity_sold INT,
  amount_sold REAL
);

INSERT INTO orders VALUES
  (1, 5, 3, 3, 1, 2, 400),
  (2, 7, 6, 4, 2, 1, 220),
  (3, 1, 5, 2, 3, 4, 1320),
  (4, 2, 4, 6, 2, 6, 360),
  (5, 9, 1, 5, 1, 3, 150),
  (6, 3, 4, 6, 1, 2, 440),
  (7, 10, 2, 1, 3, 5, 900),
  (8, 4, 3, 3, 2, 3, 450),
  (9, 5, 6, 4, 1, 1, 200),
  (10, 6, 7, 4, 3, 1, 350),
  (11, 8, 8, 3, 2, 4, 960),
  (12, 7, 4, 6, 1, 2, 440),
  (13, 1, 7, 4, 3, 3, 990);

-- sqlite command
.mode markdown
.header on

SELECT * FROM orders;

CREATE TABLE menu (
  menu_id INT PRIMARY KEY,
  menu_name TEXT,
  menu_nationality TEXT
);

INSERT INTO menu VALUES
  (1, 'Pizza', 'Italian'),
  (2, 'Sushi', 'Japanese'),
  (3, 'Chicken Masala', 'Indian'),
  (4, 'Hamburger', 'American'),
  (5, 'Mapo Tofu', 'Chinese'),
  (6, 'Tom Yum Kung', 'Thai'),
  (7, 'Cabonara', 'Italian'),
  (8, 'Bulgogi', 'Korean'),
  (9, 'Som tum', 'Thai'),
  (10, 'Fish and Chips', 'British');

.mode markdown
.header on

SELECT * FROM menu;

CREATE TABLE salespersons (
  salesperson_id INT PRIMARY KEY,
  salesperson_name TEXT,
  salesperson_jobtype TEXT
);

INSERT INTO salespersons VALUES
  (1, 'Minji', 'Full-Time'),
  (2, 'Alex', 'Part-time'),
  (3, 'Chompoo', 'Part-Time'),
  (4, 'Mina', 'Full-Time'),
  (5, 'Mark', 'Full-Time'),
  (6, 'Jiwon', 'Full-Time'),
  (7, 'Saiki', 'Part-Time'),
  (8, 'Jun', 'Part-Time');

.mode markdown
.header on

SELECT * FROM salespersons;

CREATE TABLE locations (
  location_id INT PRIMARY KEY,
  location_name TEXT,
  location_province TEXT
);

INSERT INTO locations VALUES
  (1, 'Ari', 'Bangkok'),
  (2, 'Thonglor', 'Bangkok'),
  (3, 'Asoke', 'Bangkok'),
  (4, 'Siam', 'Bangkok'),
  (5, 'Pattaya', 'Chonburi'),
  (6, 'Bangsaen', 'Chonburi');

.mode markdown
.header on

SELECT * FROM locations;

CREATE TABLE payments (
  payment_id INT PRIMARY KEY,
  payment_type TEXT
);

INSERT INTO payments VALUES
  (1, 'Cash'),
  (2, 'Credit Card'),
  (3, 'Bank Transfer');

.mode markdown
.header on

SELECT * FROM payments;

SELECT
  orders.order_id,
  menu.menu_name,
  salespersons.salesperson_name,
  locations.location_name,
  payments.payment_type,
  orders.quantity_sold,
  orders.amount_sold
FROM orders
JOIN menu ON orders.menu_id = menu.menu_id
JOIN salespersons ON orders.salesperson_id = salespersons.salesperson_id
JOIN locations ON orders.location_id = locations.location_id
JOIN payments ON orders.payment_id = payments.payment_id;

SELECT DISTINCT menu_nationality,
  CASE 
    WHEN menu_nationality IN ('American', 'British', 'Italian') THEN 'Western food'
    ELSE 'Asian food'
  END AS Food_segment
FROM menu
ORDER BY 2;

SELECT 
  menu_nationality,
  COUNT(*) AS n_orders
FROM (
  SELECT
  orders.order_id,
  menu.menu_nationality,
  locations.location_province,
  orders.amount_sold
  FROM orders
  JOIN menu ON orders.menu_id = menu.menu_id
  JOIN locations ON orders.location_id = locations.location_id
  WHERE locations.location_province <> 'Chonburi'
) AS sub
GROUP BY menu_nationality
ORDER BY n_orders DESC;

WITH sub AS (
  SELECT
  orders.order_id,
  salespersons.salesperson_name,
  locations.location_name,
  orders.amount_sold
  FROM orders
  JOIN salespersons ON orders.salesperson_id = salespersons.salesperson_id
  JOIN locations ON orders.location_id = locations.location_id
)
SELECT 
  salesperson_name,
  location_name,
  SUM(amount_sold) AS amount_sold
FROM sub
GROUP BY salesperson_name
ORDER BY amount_sold DESC;
