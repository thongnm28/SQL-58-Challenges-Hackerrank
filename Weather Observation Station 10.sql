SELECT 
DISTINCT CITY 
FROM STATION
WHERE NOT
( CITY LIKE '%U'
 OR CITY LIKE '%E'
 OR CITY LIKE '%O'
 OR CITY LIKE '%A'
 OR CITY LIKE '%I'
)
;