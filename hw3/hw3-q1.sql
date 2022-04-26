WITH LongestTime AS
	(SELECT f1.origin_city AS oc, MAX(f1.actual_time) AS MaxTime
		FROM FLIGHTS AS f1
		GROUP BY f1.origin_city)
SELECT f.origin_city, f.dest_city, MAX(f.actual_time) AS time
	FROM FLIGHTS AS f, LongestTime AS LT
	WHERE f.origin_city = LT.oc
	AND f.actual_time = LT.MaxTime
	GROUP BY f.origin_city, f.dest_city
	ORDER BY f.origin_city ASC, dest_city