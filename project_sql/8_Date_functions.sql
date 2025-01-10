SELECT 
    CURRENT_DATE + INTERVAL '12 days' AS add_12_days,
    '2025-05-20'::DATE + INTERVAL '2 months' AS add_2_months,


-- Difference in days between two dates
SELECT '2025-09-30'::DATE - '2025-01-18'::DATE AS diff_days;

-- Difference in months (you may need to use EXTRACT for more precision)
SELECT EXTRACT(MONTH FROM AGE('2025-07-10'::DATE, '2025-01-01'::DATE)) AS diff_months;


-- TO_CHAR() - very customizable

SELECT TO_CHAR(CURRENT_DATE, 'DD-MM-YYYY') AS formatted_date;
SELECT TO_CHAR(NOW(), 'Day, Month DD, YYYY') AS fancy_date;
