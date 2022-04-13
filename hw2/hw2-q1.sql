--For question 1, the return table
SELECT DISTINCT(F.flight_num) FROM FLIGHTS AS F
	JOIN WEEKDAYS AS W ON F.day_of_week_id = W.did
	JOIN CARRIERS AS C ON F.carrier_id = C.cid
	WHERE F.origin_city = "Seattle WA" AND F.dest_city = "Boston MA"
	AND c.name = "Alaska Airlines Inc."
	AND W.day_of_week = "Monday";