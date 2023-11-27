WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT numbers.n + 1
    FROM numbers 
    WHERE numbers.n <= 19
)
SELECT REPEAT('* ', numbers.n) 
FROM numbers 
ORDER BY numbers.n ASC;