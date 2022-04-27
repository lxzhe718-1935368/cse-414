-- query returns 109 rows
-- It took about 8s to run in Azure
-- First 20 rows:
-- Aberdeen SD
-- Abilene TX
-- Alpena MI
-- Ashland WV
-- Augusta GA
-- Barrow AK
-- Beaumont/Port Arthur TX
-- Bemidji MN
-- Bethel AK
-- Binghamton NY
-- Brainerd MN
-- Bristol/Johnson City/Kingsport TN
-- Butte MT
-- Carlsbad CA
-- Casper WY
-- Cedar City UT
-- Chico CA
-- College Station/Bryan TX
-- Columbia MO
-- Columbus GA
SELECT f.origin_city AS city
	FROM FLIGHTS AS f
	WHERE f.canceled = 0
	GROUP BY f.origin_city
		HAVING MAX(f.actual_time) < 180 
	ORDER BY f.origin_city ASC