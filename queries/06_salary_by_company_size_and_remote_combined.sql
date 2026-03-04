--- Combined remote ratio and company size compared to salary in the US
--- Filtered to full-time only
--- See 04_salary_by_remote_ratio.sql and 05_salary_by_company_size.sql for individual variable analysis before combination
--- Note: small sample sizes for hybrid roles; should exclude from analysis
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
  company_size,
  remote_ratio,
  avg_salary_usd,
  number_of_roles,
  inoffice_baseline,
  ROUND((avg_salary_usd - inoffice_baseline) / inoffice_baseline * 100, 1) AS pct_delta_vs_inoffice
FROM with_baseline
ORDER BY company_size, remote_ratio
