-- query returns 334 rows
-- It took about 7s to run in Azure
-- First 20 rows that return: 
-- Aberdeen SD	Minneapolis MN	106
-- Abilene TX	Dallas/Fort Worth TX	111
-- Adak Island AK	Anchorage AK	471
-- Aguadilla PR	New York NY	368
-- Akron OH	Atlanta GA	408
-- Albany GA	Atlanta GA	243
-- Albany NY	Atlanta GA	390
-- Albuquerque NM	Houston TX	492
-- Alexandria LA	Atlanta GA	391
-- Allentown/Bethlehem/Easton PA	Atlanta GA	456
-- Alpena MI	Detroit MI	80
-- Amarillo TX	Houston TX	390
-- Anchorage AK	Barrow AK	490
-- Appleton WI	Atlanta GA	405
-- Arcata/Eureka CA	San Francisco CA	476
-- Asheville NC	Chicago IL	279
-- Ashland WV	Cincinnati OH	84
-- Aspen CO	Los Angeles CA	304
-- Atlanta GA	Honolulu HI	649
-- Atlantic City NJ	Fort Lauderdale FL	212
WITH LongestTime AS
	(SELECT f1.origin_city AS oc, MAX(f1.actual_time) AS MaxTime
		FROM FLIGHTS AS f1
		GROUP BY f1.origin_city)
SELECT f.origin_city, f.dest_city, MAX(f.actual_time) AS time
	FROM FLIGHTS AS f, LongestTime AS LT
	WHERE f.origin_city = LT.oc
	AND f.actual_time = LT.MaxTime
	GROUP BY f.origin_city, f.dest_city
	ORDER BY f.origin_city ASC, dest_city ASC