--- Highest 15 paying tech roles in the US
--- Filtered to full-time only
SELECT
  job_title,
  ROUND(AVG(salary_in_usd), 0) AS avg_salary_usd,
  COUNT (*) AS number_of_roles
  FROM `project-b19ee107-f1f3-4054-940.glotal_tech_salaries.global_salaries`
  WHERE employee_residence = 'US'
  AND employment_type = 'FT'
  GROUP BY job_title
  ORDER BY avg_salary_usd DESC
  LIMIT 15
