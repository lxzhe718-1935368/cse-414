--For question 5, the return table contains 6 rows
SELECT c.name, (SUM(f.canceled)*100.0/COUNT(f.canceled)) AS percentage
	FROM FLIGHTS AS f
		INNER JOIN CARRIERS AS c ON f.carrier_id = c.cid
	WHERE f.origin_city = "Seattle WA"
	GROUP BY c.name HAVING percentage > 0.5;
