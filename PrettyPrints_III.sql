-- 1
CREATE VIEW Under_100 AS
SELECT items.item_id, items.Title, items.Artist, items.unit_price, orderline.order_qty
FROM items, orderline
WHERE items.item_id = orderline.item_id
AND unit_price < 100;

-- 2
CREATE VIEW Allen AS
SELECT customers.customer_id, customers.customer_name, customers.customer_phone, items.Title, items.Artist
FROM customers, items, orderline, orders
WHERE customers.customer_id = orders.customer_id
AND orders.order_id = orderline.order_id
AND orderline.item_id = items.item_id;

-- 3
CREATE VIEW orders AS 
SELECT items.item_id, items.Title, items.artist, items.unit_price, orderline.order_qty 
FROM items JOIN orderline ON items.item_id = orderline.item_id JOIN orders ON orderline.order_id = orderline.order_id 
WHERE orders.order_date BETWEEN '2014-01-01' AND '2014-02-28';

-- 4
CREATE VIEW zip_27 AS
SELECT customers.customer_name, customers.customer_phone, items.Title, items.Artist, orders.ship_date
FROM customers, items, orders, orderline
WHERE customers.customer_id = orders.customer_id
AND orders.order_id = orderline.order_id
AND orderline.item_id = items.item_id
AND customer_zip LIKE '27%';

-- 5
CREATE INDEX customer_id
ON customers(customer_id);

CREATE INDEX name_
ON customers(customer_name);

CREATE INDEX shipped
ON customers(customer_id, ship_date);

-- 6
DROP INDEX name_
ON customers;

-- 7
ALTER TABLE items
ADD CHECK (unit_price > 35);

-- 8
ALTER TABLE orders
ADD FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE orderline
ADD FOREIGN KEY (item_id)
REFERENCES items(item_id);

-- 9
ALTER TABLE items
ADD TYPE CHAR(1);

-- 10
UPDATE items
SET TYPE = 'M'
WHERE Title = 'Skies Above';

-- 11
ALTER TABLE items
MODIFY COLUMN Artist CHAR(30);

-- 12
DROP TABLE orders;