WITH InterFlight AS
	(SELECT DISTINCT(f1.dest_city) AS dc
		FROM FLIGHTS AS f1
		WHERE f1.origin_city = 'Seattle WA')
SELECT DISTINCT(f2.dest_city) AS city
	FROM FLIGHTS AS f2
		JOIN InterFlight ON f2.origin_city = InterFlight.dc AND f2.dest_city NOT IN InterFlight
		AND f2.dest_city != 'Seattle WA'