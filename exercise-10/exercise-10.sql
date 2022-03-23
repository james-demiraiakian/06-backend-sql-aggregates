-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE

SELECT
	EXTRACT (year FROM payment.payment_date) AS y,
    EXTRACT (month FROM payment.payment_date) AS m,
    EXTRACT (day FROM payment.payment_date) AS d,
    rating,
    SUM (amount) AS sum
FROM
	payment
INNER JOIN
	rental
ON
	rental.rental_id = payment.rental_id
INNER JOIN 
	inventory
ON 
	inventory.inventory_id = rental.inventory_id
INNER JOIN 
	film
ON 
	film.film_id = inventory.film_id
GROUP BY
	CUBE (y, m, d, rating)
ORDER BY
    rating ASC,
	y ASC,
    m ASC,
    d ASC;
