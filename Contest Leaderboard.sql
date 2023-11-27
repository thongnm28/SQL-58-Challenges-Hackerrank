SELECT subquery.hacker_id, h.name, SUM(subquery.max_score) AS total_score
FROM hackers AS h
INNER JOIN (
    SELECT hacker_id, challenge_id, MAX(score) AS max_score
    FROM submissions
    GROUP BY hacker_id, challenge_id
) AS subquery ON h.hacker_id = subquery.hacker_id
GROUP BY subquery.hacker_id, h.name
HAVING total_score > 0
ORDER BY total_score DESC, subquery.hacker_id;