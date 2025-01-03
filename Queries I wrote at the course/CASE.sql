CREATE TABLE location_category AS

SELECT 
    job_title_short,
    job_location,
    CASE
        WHEN job_location LIKE '%N%Y%' THEN 'Local'
        WHEN job_location = 'Anywhere' THEN 'Remote'
    END AS location_category
FROM job_postings_fact;

SELECT*, COUNT(job_title_short)
FROM location_category
WHERE location_category LIKE '%ocal' AND job_location NOT LIKE '%New York%'
GROUP BY location_category
