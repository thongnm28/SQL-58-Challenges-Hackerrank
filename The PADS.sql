SELECT Result FROM (
    SELECT CONCAT(Name, '(', SUBSTRING(Occupation,1,1), ')') AS Result, 1 as SortOrder
    FROM OCCUPATIONS
    UNION ALL
    SELECT CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.'), COUNT(*) as SortOrder
    FROM OCCUPATIONS
    GROUP BY Occupation
) AS SubQuery
ORDER BY 
    CASE 
        WHEN Result LIKE 'There are a total of%' THEN SortOrder
        ELSE 1
    END ASC,
    Result ASC;