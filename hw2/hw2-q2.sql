SELECT C.name, f1.flight_num, f1.origin_city, f1.dest_city, f1.actual_time,
	   f2.flight_num, f2.origin_city, f2.dest_city, f2.actual_time,
	   SUM(f1.actual_time + f2.actual_time) AS actual_time
	FROM FLIGHTS AS F1, FLIGHTS AS F2
		JOIN WEEKDAYS AS W ON F.day_of_week_id = W.did
		JOIN CARRIERS AS C ON F.carrier_id = C.cid
	WHERE F1.dest_city = F2.origin_city