  --- Remote ratio compared to average salary in the US 
  --- Filtered to full-time only
SELECT
  remote_ratio,
  ROUND(AVG(salary_in_usd), 0) AS avg_salary_usd,
  COUNT (*) AS number_of_roles
FROM `project-b19ee107-f1f3-4054-940.glotal_tech_salaries.global_salaries`
WHERE employee_residence = 'US'
AND employment_type = 'FT'
GROUP BY remote_ratio
ORDER BY remote_ratio
