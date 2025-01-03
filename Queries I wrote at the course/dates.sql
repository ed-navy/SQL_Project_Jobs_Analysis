SELECT 
    COUNT(job_id) AS qty_of_jobs,
    EXTRACT (MONTH FROM job_posted_date) as month
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY month --EXTRACT (MONTH FROM job_posted_date)
ORDER BY qty_of_jobs DESC;
