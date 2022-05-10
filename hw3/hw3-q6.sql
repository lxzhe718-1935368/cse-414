-- query returns 4 rows
-- It took about 5s to run in Azure
-- First 4 rows:
-- Alaska Airlines Inc.
-- SkyWest Airlines Inc.
-- United Air Lines Inc.
-- Virgin America
WITH GoalFlight AS 
    (SELECT DISTINCT(f.carrier_id) AS carrID
		FROM FLIGHTS AS f
		WHERE f.origin_city = 'Seattle WA'
		AND f.dest_city = 'San Francisco CA')
SELECT c.name AS carrier
	FROM GoalFlight AS gf, CARRIERS AS c
	WHERE gf.carrID = c.cid
	ORDER BY carrier ASC