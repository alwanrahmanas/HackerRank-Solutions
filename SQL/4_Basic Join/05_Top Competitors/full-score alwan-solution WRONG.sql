SELECT hackers.hacker_id AS hi, hackers.name AS n
FROM hackers
INNER JOIN challenges ON hackers.hacker_id = challenges.hacker_id
INNER JOIN difficulty ON challenges.difficulty_level = difficulty.difficulty_level
INNER JOIN submissions ON hackers.hacker_id = submissions.hacker_id
WHERE submissions.score = difficulty.score 
GROUP BY hackers.hacker_id, hackers.name
HAVING COUNT(hackers.hacker_id) > 1
ORDER BY COUNT(submissions.hacker_id)  DESC, submissions.hacker_id ASC;

1. Incorrect Join Relationships:
Problem: Your query directly joins hackers with challenges on hacker_id and submissions on hacker_id, without properly linking submissions to challenges.
Consequence: This results in incorrect associations between hackers, challenges, and submissions, as the query doesn't' correctly track which hacker submitted which challenge.
Solution: You should have joined submissions to challenges using challenge_id, which properly links submissions to the specific challenges.
  
2. Redundant and Unnecessary Conditions:
Problem: In your WHERE clause, you added an extra condition: challenges.difficulty_level = difficulty.difficulty_level. This condition is unnecessary since you've' already defined this relationship in the INNER JOIN clause.
Consequence: While this doesn’t'' change the result, it adds redundancy, which could make your query harder to read and maintain.
  
3. Improper Use of ORDER BY Clause:
Problem: You tried to order the results by COUNT(submissions.hacker_id) DESC, submissions.hacker_id ASC. The second part, submissions.hacker_id ASC, doesn’t make sense because you are ordering by a grouped count and trying to order by a non-grouped column.
Consequence: This could lead to incorrect sorting or errors depending on the SQL engine.
Solution: You should order by the count and then by hackers.hacker_id ASC, ensuring that ties in the count are broken by hacker_id.
