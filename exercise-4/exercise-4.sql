-- the average film length by category
-- include the category name and avg length

SELECT 
	AVG (length) AS avg,
    name
FROM
	film
RIGHT JOIN
	film_category
ON
	film.film_id = film_category.film_id
LEFT JOIN
	category
ON
	category.category_id = film_category.category_id
GROUP BY
	name