--- Remote ratio and company size compared to salary in the US
--- Filtered to full-time only
--- Minimum threshold of 10 records for significance
WITH base AS(
  SELECT 
    company_size,
    remote_ratio,
    ROUND(AVG(salary_in_usd), 0) AS avg_salary_usd,
    COUNT(*) AS number_of_roles
  FROM `project-b19ee107-f1f3-4054-940.glotal_tech_salaries.global_salaries`
  WHERE employee_residence = 'US'
  AND employment_type = 'FT'
  GROUP BY company_size, remote_ratio
  HAVING COUNT(*)>=10
),

with_baseline AS (
  SELECT *,
    FIRST_VALUE(avg_salary_usd) OVER (
      PARTITION BY company_size
      ORDER BY remote_ratio
    ) AS inoffice_baseline
  FROM base
)

SELECT
  CASE company_size
    WHEN 'S' THEN 'Small'
    WHEN 'M' THEN 'Mid-size' 
    WHEN 'L' THEN 'Large'
    End AS company_size,
  remote_ratio,
  avg_salary_usd,
  number_of_roles,
  inoffice_baseline,
  ROUND((avg_salary_usd - inoffice_baseline) / inoffice_baseline * 100, 1) AS pct_delta_vs_inoffice
FROM with_baseline
ORDER BY company_size, remote_ratio

