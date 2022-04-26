SELECT f.origin_city AS city
	FROM FLIGHTS AS f
	WHERE f.canceled = 0
	GROUP BY f.origin_city
		HAVING MAX(f.actual_time) < 180 
	ORDER BY f.origin_city ASC