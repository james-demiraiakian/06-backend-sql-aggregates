-- ROLLUP of amount made per year, month, day
-- use ROLLUP and EXTRACT YEAR, MONTH, DAY from payment_date

SELECT
	EXTRACT (year FROM payment.payment_date) AS y,
    EXTRACT (month FROM payment.payment_date) AS m,
    EXTRACT (day FROM payment.payment_date) AS d,
    SUM (amount) AS sum
FROM
	payment
GROUP BY
	ROLLUP (y, m, d)
