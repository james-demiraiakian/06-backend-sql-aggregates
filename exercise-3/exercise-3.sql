-- the average rental amount by country
-- include the country name and avg amount
-- use AVG to average the amount

SELECT
    country,
    AVG(amount) AS avg
FROM
	country
LEFT JOIN
	city
ON
	city.country_id = country.country_id
LEFT JOIN
	address
ON
	address.city_id = city.city_id
RIGHT JOIN
	customer
ON
	customer.address_id = address.address_id
RIGHT JOIN
	rental
ON
	customer.customer_id = rental.customer_id
LEFT JOIN
	payment
ON
	payment.rental_id = rental.rental_id

GROUP BY 
	country
ORDER BY
	avg DESC
LIMIT
	10;