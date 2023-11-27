WITH a AS (
    SELECT b.hacker_id, b.chall_total,
      RANK() OVER (ORDER BY b.chall_total DESC) AS rnk
    FROM (SELECT hacker_id, COUNT(challenge_id) AS chall_total
          FROM challenges
          GROUP BY hacker_id) AS b
)
SELECT a.hacker_id, h.name, a.chall_total
FROM a
JOIN Hackers h ON a.hacker_id = h.hacker_id
WHERE a.rnk IN (
    SELECT rnk
    FROM a
    GROUP BY rnk
    HAVING COUNT(hacker_id) = 1
) OR a.rnk = 1
ORDER BY a.chall_total DESC, a.hacker_id;