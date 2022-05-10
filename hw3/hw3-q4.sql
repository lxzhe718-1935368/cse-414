-- query returns 256 rows
-- It took about 6s to run in Azure
-- First 20 rows:
-- Aberdeen SD
-- Abilene TX
-- Adak Island AK
-- Aguadilla PR
-- Akron OH
-- Albany GA
-- Albany NY
-- Alexandria LA
-- Allentown/Bethlehem/Easton PA
-- Alpena MI
-- Amarillo TX
-- Appleton WI
-- Arcata/Eureka CA
-- Asheville NC
-- Ashland WV
-- Aspen CO
-- Atlantic City NJ
-- Augusta GA
-- Bakersfield CA
-- Bangor ME
WITH InterFlight AS
	(SELECT DISTINCT(f1.dest_city) AS dc
		FROM FLIGHTS AS f1
		WHERE f1.origin_city = 'Seattle WA')
SELECT DISTINCT(f2.dest_city) AS city
	FROM FLIGHTS AS f2
		JOIN InterFlight ON f2.origin_city = InterFlight.dc
		AND f2.dest_city NOT IN (SELECT dc FROM InterFlight)
		AND f2.dest_city != 'Seattle WA'
	ORDER BY city ASC