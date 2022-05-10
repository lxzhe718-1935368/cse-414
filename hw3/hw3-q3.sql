-- query returns 327 rows
-- It took about 5s to run in Azure
-- First 20 rows:
-- Guam TT	0.0
-- Pago Pago TT	0.0
-- Aguadilla PR	28.8973384030418
-- Anchorage AK	31.8120805369128
-- San Juan PR	33.6605316973415
-- Charlotte Amalie VI	39.5588235294118
-- Ponce PR	40.9836065573771
-- Fairbanks AK	50.1165501165501
-- Kahului HI	53.5144713526285
-- Honolulu HI	54.7390288236822
-- San Francisco CA	55.8288645371882
-- Los Angeles CA	56.0808908229873
-- Seattle WA	57.6093877922314
-- Long Beach CA	62.176439513999
-- New York NY	62.371834136728
-- Kona HI	63.1607929515419
-- Las Vegas NV	64.9202563720376
-- Christiansted VI	65.1006711409396
-- Newark NJ	65.8499710969808
-- Plattsburgh NY	66.6666666666667
SELECT f.origin_city,
	SUM(CASE WHEN f.actual_time < 180 THEN 1 ELSE 0 END) * 100.0 / COUNT(f.fid) AS percentage
	FROM FLIGHTS AS f
	WHERE f.canceled = 0
	GROUP BY f.origin_city
	ORDER BY percentage ASC, f.origin_city ASC

