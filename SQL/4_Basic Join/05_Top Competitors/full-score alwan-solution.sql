SELECT hackers.hacker_id AS hi, hackers.name AS n
FROM hackers
INNER JOIN submissions ON hackers.hacker_id = submissions.hacker_id
INNER JOIN challenges ON submissions.challenge_id = challenges.challenge_id
INNER JOIN difficulty ON challenges.difficulty_level = difficulty.difficulty_level
WHERE submissions.score = difficulty.score
GROUP BY hackers.hacker_id, hackers.name
HAVING COUNT(submissions.hacker_id) > 1
ORDER BY COUNT(submissions.hacker_id) DESC, hackers.hacker_id ASC;
