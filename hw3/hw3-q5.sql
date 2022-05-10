-- query returns 3 rows
-- It took about 7s to run in Azure
-- First 3 rows:
-- Devils Lake ND
-- Hattiesburg/Laurel MS
-- St. Augustine FL
WITH InterFlight AS
	(SELECT DISTINCT(f1.dest_city) AS dc
		FROM FLIGHTS AS f1
		WHERE f1.origin_city = 'Seattle WA'),
SecondF AS (SELECT DISTINCT(f2.dest_city) AS dc2
	FROM FLIGHTS AS f2
		JOIN InterFlight ON f2.origin_city = InterFlight.dc
		AND f2.dest_city NOT IN (SELECT dc FROM InterFlight)
		AND f2.dest_city != 'Seattle WA')
SELECT DISTINCT(f3.dest_city) AS city
	FROM FLIGHTS AS f3
	WHERE f3.dest_city NOT IN (SELECT dc FROM InterFlight)
	AND f3.dest_city NOT IN (SELECT dc2 FROM SecondF)
	AND f3.origin_city IN (SELECT dc2 FROM SecondF)
	AND f3.dest_city != 'Seattle WA'
	ORDER BY city ASC