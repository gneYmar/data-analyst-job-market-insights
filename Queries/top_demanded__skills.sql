--- Question: What are top 5 in—demand skills for data analysts?
SELECT skills,
    COUNT(job_postings_fact.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
/*
 | Rank | Skill        | Demand Count |
 | ---- | ------------ | ------------ |
 | 1    |   SQL        | 92,628       |
 | 2    |   Excel      | 67,031       |
 | 3    |   Python     | 57,326       |
 | 4    |   Tableau    | 46,554       |
 | 5    |   Power BI   | 39,468       |
 
 - SQL, Excel, Python, Tableau, and Power BI are the top 5 in-demand skills for data analysts.
 */