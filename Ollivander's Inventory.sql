SELECT  w.id, p.age, w.coins_needed, w.power
FROM Wands as w
JOIN Wands_Property as p 
    ON w.code = p.code 
WHERE p.is_evil = 0
AND w.coins_needed = ( SELECT MIN(coins_needed) 
                      FROM Wands a 
                      INNER JOIN Wands_Property p ON a.code = p.code 
                      WHERE a.code = w.code AND a.power = w.power) 
GROUP BY w.id, p.age, w.coins_needed, w.power
ORDER BY w.power desc, p.age desc