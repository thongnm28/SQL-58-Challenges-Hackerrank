SELECT
MAX(CASE WHEN OCCUPATION = 'Doctor' THEN NAME ELSE NULL END) AS DOCTOR,
MAX(CASE WHEN OCCUPATION = 'Professor' THEN NAME ELSE NULL END) AS PROFESSOR,
MAX(CASE WHEN OCCUPATION = 'Singer' THEN NAME ELSE NULL END) AS SINGER,
MAX(CASE WHEN OCCUPATION = 'Actor' THEN NAME ELSE NULL END) AS ACTOR
FROM
(SELECT
NAME, OCCUPATION, ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) AS OCC FROM OCCUPATIONS)
AS TEMP GROUP BY OCC;