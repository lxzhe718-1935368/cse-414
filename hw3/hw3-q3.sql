SELECT f.origin_city,
	(SUM(f.actual_time < 180) * 100.0 / COUNT(f.fid)) AS percentage
	FROM FLIGHTS AS f
	WHERE f.canceled = 0
	GROUP BY f.origin_city
	ORDER BY percentage ASC, f.origin_city