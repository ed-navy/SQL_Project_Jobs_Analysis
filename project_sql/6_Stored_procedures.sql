


CREATE OR REPLACE FUNCTION GetReport4 (
    JobTitle VARCHAR(50),
    MinSalary NUMERIC(10,2)
)
RETURNS SETOF job_postings_fact --(job_title_short VARCHAR, salary_year_avg NUMERIC)
LANGUAGE SQL

AS $$

        SELECT * -- job_title_short, salary_year_avg
        FROM job_postings_fact
        WHERE job_title_short LIKE JobTitle AND salary_year_avg > MinSalary
        LIMIT 100;
$$;

-- Call the function
SELECT * FROM GetReport4('%Data%', 300000);


-- Delete the function 
DROP FUNCTION GetReport4;


-- use with Aggregation Function
CREATE OR REPLACE FUNCTION GetAverageSalary(
    JobTitle VARCHAR(50)
)
RETURNS NUMERIC AS $$
    SELECT AVG(salary_year_avg)
    FROM job_postings_fact
    WHERE job_title_short = JobTitle;
$$ LANGUAGE SQL;

-- Call the function
SELECT GetAverageSalary('Data Scientist');

-- Example: Conditional Logic
CREATE OR REPLACE FUNCTION SalaryCategory(Salary NUMERIC)
RETURNS TEXT AS $$
BEGIN
    IF Salary < 50000 THEN
        RETURN 'Low';
    ELSIF Salary BETWEEN 50000 AND 100000 THEN
        RETURN 'Medium';
    ELSE
        RETURN 'High';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Call the function
SELECT SalaryCategory(75000);
