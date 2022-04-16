--For question 8, the return table contains 22 rows
SELECT c.name, SUM(f.departure_delay) AS delay
	FROM FLIGHTS AS f
		INNER JOIN CARRIERS  AS c ON f.carrier_id = c.cid
	GROUP BY c.name;