SELECT ROUND(ABS((MIN(lat_n) - MAX(lat_n)) + (MIN(long_w) - MAX(long_w))), 4)
FROM station;