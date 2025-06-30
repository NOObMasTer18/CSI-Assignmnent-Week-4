SELECT
  h.hacker_id,
  h.name,
  SUM(t.max_score) AS total_score
FROM Hackers h
JOIN (
    SELECT
      s.hacker_id,
      s.challenge_id,
      MAX(s.score) AS max_score
    FROM Submissions s
    GROUP BY s.hacker_id, s.challenge_id
) AS t
ON h.hacker_id = t.hacker_id
GROUP BY h.hacker_id, h.name
HAVING total_score > 0
ORDER BY total_score DESC, h.hacker_id;