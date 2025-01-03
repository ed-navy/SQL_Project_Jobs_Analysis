


WITH aaa AS (
    SELECT skills_job_dim.job_id, skills_dim.skill_id, skills_dim.skills
    FROM skills_job_dim
    LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
)

SELECT aaa.skills,  COUNT(job_postings_fact.job_title_short) AS count_of_postings
FROM job_postings_fact
LEFT JOIN aaa ON job_postings_fact.job_id = aaa.job_id
WHERE job_location = 'Anywhere' AND job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY aaa.skills
ORDER BY count_of_postings DESC
LIMIT 5



/*
SELECT *  --job_id - remote
FROM job_postings_fact
WHERE job_location = 'Anywhere'
LIMIT 100

SELECT *   --skill_id - skills
FROM skills_dim
LIMIT 100

SELECT *   --job_id - skill_id
FROM skills_job_dim
LIMIT 100


*/