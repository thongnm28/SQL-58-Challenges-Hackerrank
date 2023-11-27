SELECT
    ROUND(SUM(lat_n), 2) AS rounded_sum_lat_n,
    ROUND(SUM(long_w), 2) AS rounded_sum_long_w
FROM station;