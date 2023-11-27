SELECT s.hacker_id, h.name
FROM submissions s
INNER JOIN challenges c ON s.challenge_id = c.challenge_id
INNER JOIN difficulty d ON d.difficulty_level = c.difficulty_level
INNER JOIN hackers h ON h.hacker_id = s.hacker_id
WHERE s.score = d.score
GROUP BY s.hacker_id, h.name
HAVING COUNT(h.name) > 1
ORDER BY COUNT(h.name) DESC, s.hacker_id ASC;