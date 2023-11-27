SELECT 
      n
    , CASE WHEN p is null THEN 'Root'
          WHEN n IN (SELECT DISTINCT p from bst) THEN 'Inner'
          ELSE 'Leaf' END AS result
FROM bst
ORDER BY n