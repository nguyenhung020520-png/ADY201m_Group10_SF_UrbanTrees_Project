
CREATE OR REPLACE TABLE feat AS
SELECT nbhd, requested_datetime, n, permits_active, hour(requested_datetime) AS hr, dayofweek(requested_datetime) AS dow, month(requested_datetime) AS mon, dayofyear(requested_datetime) AS doy, LAG(n, 1) OVER w AS y_lag1, LAG(n, 2) OVER w AS y_lag2, LAG(n, 3) OVER w AS y_lag3, LAG(n, 7) OVER w AS y_lag7, LAG(n, 14) OVER w AS y_lag14, LAG(n, 28) OVER w AS y_lag28, AVG(n) OVER (w ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS y_ma_season, STDDEV(n) OVER (w ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS y_sd_season, n - LAG(n, 1) OVER w AS y_diff1, LAG(permits_active, 7) OVER w AS permits_active_lag_season, LEAD(n, 1) OVER w AS y_h1, LEAD(n, 7) OVER w AS y_h7
FROM clean WINDOW w AS (PARTITION BY nbhd ORDER BY requested_datetime)
ORDER BY nbhd, requested_datetime;
