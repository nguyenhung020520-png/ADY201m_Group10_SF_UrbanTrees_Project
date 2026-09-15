
-- Step 3: sql/queries.sql
CREATE OR REPLACE TABLE tr AS SELECT * FROM 'data/processed/sf_trees.parquet';
-- Q1: requests per neighborhood and year; seasonal pattern; storm days
SELECT nbhd, year(date) AS yr, SUM(n) AS requests, SUM(hazard) AS hazard FROM tr GROUP BY 1, 2 ORDER BY 1, 2;
SELECT month(date) AS mon, AVG(n) AS n_per_day FROM tr GROUP BY 1 ORDER BY 1;
-- Q2: gust and rain effect: requests on days with gusts above 40 mph versus calm days
SELECT CASE WHEN wsf2 >= 40 THEN 'gust40' WHEN wsf2 >= 25 THEN 'gust25' ELSE 'calm' END AS wind, AVG(n) AS n_per_day, AVG(hazard) AS hazard_per_day FROM tr GROUP BY 1;
-- Q3: features and targets: requests next day and next 7 days
CREATE OR REPLACE TABLE feat AS
SELECT nbhd, date, n, hazard, prcp, wsf2, tmax, dayofweek(date) AS dow, month(date) AS mon,
       LAG(n, 1) OVER w AS n_lag1, AVG(n) OVER (w ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS n_ma7, AVG(n) OVER (w ROWS BETWEEN 27 PRECEDING AND CURRENT ROW) AS n_ma28,
       SUM(prcp) OVER (w ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS prcp3, MAX(wsf2) OVER (w ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS gust3,
       LEAD(n, 1) OVER w AS y_1d, SUM(n) OVER (w ROWS BETWEEN 1 FOLLOWING AND 7 FOLLOWING) AS y_7d
FROM tr WINDOW w AS (PARTITION BY nbhd ORDER BY date);
SELECT COUNT(*) AS n, COUNT(y_7d) AS n7 FROM feat;
