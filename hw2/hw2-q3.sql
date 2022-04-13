SELECT w.day_of_week, AVG(f.arrival_delay) AS delay
	FROM FLIGHTS AS f, WEEKDAYS AS w
	WHERE f.day_of_week_id = w.did
	GROUP BY w.did
	ORDER BY delay DESC
	LIMIT 1;