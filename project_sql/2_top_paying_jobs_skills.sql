WITH bbb AS (
SELECT
    job_id,
    job_title,
    salary_year_avg,
    name
FROM job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE job_title_short = 'Data Analyst' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
),


 aaa AS (
SELECT skills_dim.skill_id, skills, job_id
FROM skills_dim
LEFT JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
)

SELECT *
FROM bbb
INNER JOIN aaa ON bbb.job_id = aaa.job_id
ORDER BY bbb.salary_year_avg DESC

