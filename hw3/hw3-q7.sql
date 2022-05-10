-- query returns 4 rows
-- It took about 4s to run in Azure
-- First 4 rows:
-- Alaska Airlines Inc.
-- SkyWest Airlines Inc.
-- United Air Lines Inc.
-- Virgin America
SELECT DISTINCT(c.name) AS carrier
	FROM FLIGHTS AS f
	INNER JOIN CARRIERS AS c ON f.carrier_id = c.cid
	WHERE f.origin_city = 'Seattle WA' AND f.dest_city = 'San Francisco CA'
	ORDER BY carrier ASC