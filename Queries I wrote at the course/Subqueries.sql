
WITH no_degree_companies AS (

    SELECT
        company_id,
        job_no_degree_mention
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = TRUE
    )

SELECT 
        no_degree_companies.company_id,
        no_degree_companies.job_no_degree_mention,
        company_dim.name
FROM company_dim
RIGHT JOIN no_degree_companies ON no_degree_companies.company_id = company_dim.company_id
ORDER BY no_degree_companies.company_id