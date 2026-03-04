--- Top 5 highest paying job titles by experience level in the US
--- Filtered to full-time only
WITH ranked_roles AS (
  SELECT
    experience_level,
    job_title,
    ROUND(AVG(salary_in_usd), 0) AS avg_salary_usd,
    COUNT (*) AS number_of_roles
  FROM `project-b19ee107-f1f3-4054-940.glotal_tech_salaries.global_salaries`
  WHERE employee_residence = 'US'
  AND employment_type = 'FT'
  GROUP BY experience_level, job_title
  ),
  ranked AS (
    SELECT*,
      RANK() OVER (PARTITION BY experience_level ORDER BY avg_salary_usd DESC) AS rank
      FROM ranked_roles
  )
  SELECT
    experience_level,
    job_title,
    avg_salary_usd,
    number_of_roles,
    rank
  FROM ranked
  WHERE rank<=5
  ORDER BY experience_level, rank
  LIMIT 40
