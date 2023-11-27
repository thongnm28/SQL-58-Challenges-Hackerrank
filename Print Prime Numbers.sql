WITH RECURSIVE numbers AS (
    SELECT 2 AS n
    UNION ALL
    SELECT numbers.n + 1 
    FROM numbers 
    WHERE numbers.n < 999
)
SELECT GROUP_CONCAT(p.n SEPARATOR '&') 
FROM numbers p 
WHERE 0 NOT IN (
    SELECT (p.n % numbers.n)
    FROM numbers
    WHERE numbers.n <> p.n
)