WITH T AS (
    SELECT
        *,
        ROW_NUMBER() OVER(ORDER BY lat_n) AS row_num
    FROM station 
)
SELECT ROUND(LAT_N,4)
FROM T
WHERE row_num = (SELECT CEIL(MAX(row_num)/2) FROM T)