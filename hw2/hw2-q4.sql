--For question 4, the return table contains 12 rows
SELECT DISTINCT(c.name) FROM FLIGHTS AS f
	INNER JOIN CARRIERS AS c ON f.carrier_id = c.cid
	WHERE f.canceled = 0
	GROUP BY f.day_of_month, f.month_id, c.name HAVING COUNT(fid) > 1000;