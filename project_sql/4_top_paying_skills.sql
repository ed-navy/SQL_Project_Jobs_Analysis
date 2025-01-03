


SELECT *
FROM skills_dim
LIMIT 100;

SELECT *
FROM skills_job_dim
LIMIT 100;

WITH aaa AS (
    SELECT skills_dim.skills, skills_job_dim.job_id
    FROM skills_dim
    INNER JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
),

bbb AS(
    SELECT *
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL

)


SELECT ROUND(avg(salary_year_avg)), aaa.skills
FROM bbb
INNER JOIN aaa ON bbb.job_id = aaa.job_id
GROUP BY aaa.skills
ORDER BY avg(salary_year_avg) DESC
