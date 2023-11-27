SELECT
SUM(C.POPULATION) AS SUM_POPULATION
FROM CITY AS C, COUNTRY AS CT
WHERE C.COUNTRYCODE = CT.CODE
AND CT.CONTINENT = 'ASIA'
;