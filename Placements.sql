WITH cte AS (
    SELECT s1.id, s1.name, p1.salary
    FROM students AS s1
    JOIN packages AS p1 ON s1.id = p1.id
)
SELECT s2.name
FROM students AS s2
JOIN friends AS f2 ON s2.id = f2.id
JOIN packages AS p2 ON s2.id = p2.id
JOIN cte ON f2.friend_id = cte.id
WHERE cte.salary > p2.salary
ORDER BY cte.salary;