-- the top 10 cities with the most total rental payment amount
-- include the city name and sum
-- use SUM to sum up the amounts


SELECT
	city,
    SUM (amount) AS sum
FROM 
	payment
LEFT JOIN 
	rental
ON 
	rental.rental_id = payment.rental_id
LEFT JOIN 
	customer
ON 
	customer.customer_id = rental.customer_id
LEFT JOIN 
	address
ON 
	address.address_id = customer.address_id
LEFT JOIN 
	city
ON 
	city.city_id = address.city_id
GROUP BY 
	city
ORDER BY 
	sum DESC
LIMIT 
	10;
