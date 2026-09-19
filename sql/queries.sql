
-- Q1: mean and spread of the target per unit and per calendar period
SELECT nbhd, month(requested_datetime) AS mon, AVG(n) AS mean_target, STDDEV(n) AS sd_target, COUNT(*) AS n FROM clean GROUP BY 1, 2 ORDER BY 1, 2;
-- Q2: share of event steps (target above the 95% quantile) per unit
WITH thr AS (SELECT quantile_cont(n, 0.95) AS q FROM clean)
SELECT nbhd, AVG((n > q)::INT) AS event_share FROM clean, thr GROUP BY 1 ORDER BY 2 DESC;
-- Q3: target by covariate decile (relationship with the secondary source)
SELECT decile, AVG(n) AS mean_target, COUNT(*) AS n FROM (SELECT NTILE(10) OVER (ORDER BY permits_active) AS decile, n FROM clean WHERE permits_active IS NOT NULL) GROUP BY 1 ORDER BY 1;
-- Q4: seasonal-naive skill check: correlation between the target and its value SEASON steps earlier
SELECT corr(n, lagged) AS r_season FROM (SELECT n, LAG(n, 7) OVER (PARTITION BY nbhd ORDER BY requested_datetime) AS lagged FROM clean);
