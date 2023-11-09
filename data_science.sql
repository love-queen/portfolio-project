-- Select everything from data science salaries table
SELECT * FROM data_science_salaries.`data science salaries`;

-- Calculating the total number of employees by company size using group by
SELECT company_size, COUNT(*) AS employee_count FROM data_science_salaries.`data science salaries`
GROUP BY company_size;

-- Determine the highest paying job title
SELECT job_title, MAX(salary_in_usd) AS maximum_salary_usd
FROM data_science_salaries.`data science salaries`
group by job_title
order by salary_in_usd desc;

SELECT job_title, MAX(salary_in_usd) AS maximum_salary_usd
FROM data_science_salaries.`data science salaries`
GROUP BY job_title
ORDER BY maximum_salary_usd DESC;

SELECT t.job_title, t.maximum_salary_usd
FROM (
  SELECT job_title, MAX(salary_in_usd) AS maximum_salary_usd
  FROM data_science_salaries.`data science salaries`
  GROUP BY job_title
) AS t
ORDER BY t.maximum_salary_usd DESC;




-- Getting the number of remote and non-remote jobs
SELECT 
    CASE 
        WHEN remote_ratio > 0 THEN 'Remote'
        ELSE 'Non-Remote'
    END AS job_type,
    COUNT(*) AS job_count
FROM data_science_salaries.`data science salaries`
GROUP BY job_type;

-- Calculating the total number of employees by employment type
SELECT employment_type, COUNT(*) AS employee_count
FROM data_science_salaries.`data science salaries`
GROUP BY employment_type;

-- calculating the highest and lowest salaries in USD
SELECT 
    MAX(salary_in_usd) AS highest_salary_usd,
    MIN(salary_in_usd) AS lowest_salary_usd
FROM data_science_salaries.`data science salaries`;

-- Calculating the maximum salary in USD by remote ratio
SELECT remote_ratio, max(salary_in_usd) AS maximum_salary_usd
FROM data_science_salaries.`data science salaries`
GROUP BY remote_ratio;

-- Determine the distribution of job titles by employment type
SELECT employment_type, job_title, COUNT(*) AS job_count
FROM data_science_salaries.`data science salaries`
GROUP BY employment_type, job_title;

-- Determine the percentage of remote jobs for each employment type
SELECT employment_type, 
       COUNT(*) AS total_jobs, 
       SUM(remote_ratio) AS remote_jobs,
       (SUM(remote_ratio) * 100 / COUNT(*)) AS remote_percentage
FROM data_science_salaries.`data science salaries`
GROUP BY employment_type;

-- Determine the distribution of job titles by company size
SELECT company_size, job_title, COUNT(*) AS job_count
FROM data_science_salaries.`data science salaries`
GROUP BY company_size, job_title;

-- Categorize job titles as "Technical" or "Non-Technical" based on certain keywords
SELECT job_title,
       CASE
           WHEN job_title LIKE '%Engineer%' OR job_title LIKE '%Developer%' THEN 'Technical'
           ELSE 'Non-Technical'
       END AS category
FROM data_science_salaries.`data science salaries`;

-- Categorize employment types as "Full-Time" or "Part-Time" based on the duration
SELECT employment_type,
       CASE
           WHEN employment_type = 'FT' THEN 'Full-Time'
           WHEN employment_type = 'PT' THEN 'Part-Time'
           ELSE 'Other'
       END AS category
FROM data_science_salaries.`data science salaries`;

-- Categorize company sizes based on the number of employees
SELECT company_size,
       CASE
           WHEN company_size = 'S' THEN 'Small'
           WHEN company_size = 'M' THEN 'Medium'
           WHEN company_size = 'L' THEN 'Large'
           ELSE 'Unknown'
       END AS size_category
FROM data_science_salaries.`data science salaries`;



























