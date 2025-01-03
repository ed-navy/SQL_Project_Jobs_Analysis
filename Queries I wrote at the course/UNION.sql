SELECT *
FROM job_postings_fact
WHERE EXTRACT (MONTH FROM job_posted_date) IN (1,2,3) AND salary_year_avg >70000 AND job_title_short = 'Data Analyst'AND job_country != 'United States'
ORDER BY job_country ASC , salary_year_avg desc

