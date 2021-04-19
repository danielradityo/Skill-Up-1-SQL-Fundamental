-- Slide 16 Select
SELECT first_name, last_name, email
FROM customer;

-- Slide 18 Distinct
SELECT DISTINCT(rating)
FROM film;

-- Slide 19 Count
SELECT COUNT(DISTINCT(first_name))
FROM customer;

-- Slide 20 Select WHERE
SELECT title, description
FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R';

-- Slide 21 Where Challenge Part 1
-- Nomor 1
SELECT email
FROM customer
WHERE email LIKE 'nancy%';
-- Nomor 2
SELECT title, description
FROM film
WHERE title = 'Outlaw Hanky';

-- Slide 22 Where Challenge Part 2
SELECT address, phone
FROM address
WHERE address ILIKE '%Ipoh Drive';

-- Slide 23 Order By
SELECT store_id, first_name, last_name
FROM customer
ORDER BY store_id ASC, first_name DESC;

-- Slide 24 LIMIT
SELECT *
FROM payment
ORDER BY payment_date DESC
LIMIT 5;

-- Slide 25 Limit Challenge 1
SELECT payment_id, payment_date
FROM payment
ORDER BY payment_date ASC
LIMIT 10;

-- Slide 26 Limit Challenge 2
SELECT title, length
FROM film
ORDER BY length ASC
LIMIT 5;

-- Slide 27 Limit Challege 3
SELECT COUNT(length)
FROM film
WHERE length <= 50;

-- Slide 28 Between
SELECT *
FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

-- Slide 29 IN
SELECT *
FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie', 'Sam');

-- Slide 31 General Challenge
-- Nomor 1 
SELECT COUNT(amount)
FROM payment
WHERE amount > 5;

-- Nomor 2
SELECT COUNT(first_name)
FROM actor
WHERE first_name ILIKE 'P%';

-- Nomor 3
SELECT COUNT(DISTINCT(district))
FROM address;

-- Alternative 
SELECT COUNT(DISTINCT(b.district))
FROM customer a
JOIN address b 
ON a.address_id = b.address_id;

-- Nomor 4
SELECT DISTINCT(district)
FROM address;

-- Slide 35 Group By
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 10;

-- Slide 35 Group By Challenge 1
SELECT staff_id, COUNT(amount)
FROM payment
GROUP BY staff_id
ORDER BY SUM(amount) DESC;

-- Slide 36 Group By Challenge 2
SELECT DISTINCT(rating), ROUND(AVG(replacement_cost), 2)
FROM film
GROUP BY rating
ORDER BY ROUND(AVG(replacement_cost), 2) DESC;

-- Slide 36 Group By Challenge 3
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

-- Slide 37 Having ???
SELECT customer_id, ROUND(AVG(amount), 2) AS avg_spent
FROM payment
GROUP BY customer_id
HAVING ROUND(AVG(amount), 2) > 5
ORDER BY AVG(amount);

-- Slide 38 Having
-- Challenge 1
SELECT customer_id, COUNT(amount) AS num_payment
FROM payment
GROUP BY customer_id
HAVING COUNT(amount) > 40;

-- Challenge 2
SELECT customer_id, ROUND(SUM(amount), 2) AS total_spent
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING ROUND(SUM(amount), 2) > 100;

-- Slide 39 In Class Exercise 1
-- Nomor 1
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 110;

-- Nomor 2
SELECT COUNT(title)
FROM film
WHERE title ILIKE 'J%';

-- Nomor 3
SELECT customer_id, first_name, last_name, address_id
FROM customer
WHERE first_name ILIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;