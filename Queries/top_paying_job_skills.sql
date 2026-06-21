/*Question:
 What are the skills required
 for
 top 10 paying Data Analyst Jobs in the US (Remotely)?
 */
-- top 10 Paying Data Analyst Jobs in the US (Remotely)
WITH top_paying_jobs AS (
    SELECT job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_jobs.*,
    skills
FROM top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;
/*
 Top 10 Most In-Demand Skills
 ----------------------------
 | Rank | Skill         | Jobs Requiring It | % of Postings |
 | ---- | ------------- | ----------------- | ------------- |
 | 1    |   SQL         | 8/8               | 100%          |
 | 2    |   Python      | 7/8               | 88%           |
 | 3    |   Tableau     | 6/8               | 75%           |
 | 4    |   R           | 4/8               | 50%           |
 | 5    |   Excel       | 3/8               | 38%           |
 | 6    |   Pandas      | 3/8               | 38%           |
 | 7    |   Snowflake   | 3/8               | 38%           |
 | 8    |   Azure       | 2/8               | 25%           |
 | 9    |   Power BI    | 2/8               | 25%           |
 | 10   |   Go          | 2/8               | 25%           |
 
 Skill Categories Breakdown
 --------------------------
 | Category                       | Share | Key Tools                         |
 | ------------------------------ | ----- | --------------------------------- |
 |   Programming Languages        | 31.8% | SQL, Python, R, Go                |
 |   Data Processing & Analysis   | 19.7% | Pandas, NumPy, Excel, PySpark     |
 |   DevOps & Collaboration       | 19.7% | Jira, Confluence, Git, Jenkins    |
 |   Cloud & Data Platforms       | 15.2% | AWS, Azure, Snowflake, Databricks |
 |   Visualization & Reporting    | 13.6% | Tableau, Power BI, PowerPoint     |
 
 Salary Insights by Skill
 -------------------------
 | Skill                                         | Avg Salary | Jobs |
 | --------------------------------------------- | ---------- | ---- |
 |   Azure / AWS / Power BI                      |    $223K   | 2    |
 |   Excel / Pandas                              |    $216K   | 3    |
 |   R                                           |    $215K   | 4    |
 |   Tableau                                     |    $214K   | 6    |
 |   SQL                                         |    $207K   | 8    |
 |   Python                                      |    $206K   | 7    |
 |   Snowflake                                   |    $193K   | 3    |
 |   Jira / Confluence / Bitbucket / Atlassian   |    $189K   | 2    |
 */