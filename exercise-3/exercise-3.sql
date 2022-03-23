-- the average rental amount by country
-- include the country name and avg amount
-- use AVG to average the amount

SELECT
    country,
    AVG (amount) AS avg
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
LEFT JOIN
	customer
ON
	customer.address_id = address.address_id
LEFT JOIN
	payment
ON
	payment.customer_id = customer.customer_id
GROUP BY 
	country
ORDER BY
	avg DESC