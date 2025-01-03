WITH aaa AS (
SELECT company_id, COUNT(job_title_short) AS qty_of_jobs
FROM job_postings_fact
GROUP BY company_id
)

SELECT 
    aaa.company_id,
    aaa.qty_of_jobs,
    company_dim.name

FROM company_dim
LEFT JOIN aaa ON company_dim.company_id = aaa.company_id
ORDER BY aaa.qty_of_jobs DESC


/*
SELECT *
FROM company_dim
WHERE company_id = 786240
LIMIT 100
*/

