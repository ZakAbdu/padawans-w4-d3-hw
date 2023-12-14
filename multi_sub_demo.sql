-- multi join

-- SELECT *
-- FROM actor 
-- INNER JOIN film_actor
-- on actor.actor_id = film_actor.actor_id

-- SELECT * 
-- FROM film_actor
-- INNER JOIN actor
-- ON actor.actor_id = film_actor.actor_id

-- SELECT title, fa.film_id
-- FROM film_actor as fa
-- INNER JOIN film
-- ON fa.film_id = film.film_id




SELECT * from film_actor

SELECT * 
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id

SELECT * from film

SELECT title, fa.film_id
from film_actor as fa
INNER JOIN film
ON fa.film_id = film.film_id

SELECT * from actor



-- SUB QUERIES

SELECT customer_id, sum(amount)
FROM payment
GROUP BY customer_id
HAVING sum(amount) < -15000
ORDER BY sum(amount)

SELECT first_name, last_name, email
FROM customer

SELECT first_name, last_name, email
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING sum(amount) < -15000
    ORDER BY sum(amount)
)

SELECT first_name, last_name
FROM (
    SELECT title, first_name, last_name
    FROM film_actor
    INNER JOIN actor
    ON actor.actor_id = film_actor.actor_id
    INNER JOIN film
    ON film_actor.film_id = film.film_id
) AS multi_join
WHERE title = 'Alone Trip'


-- SELECT Clause
SELECT first_name, last_name, (
    SELECT COUNT(rental_id)
    from rental
)
FROM customer

SELECT * from rental