--- Question: What are the top 25 high demand and a high—payin skills to learn ?
SELECT skills_dim.skill_id,
    skills_dim.skills,
    COUNT(job_postings_fact.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_postings_fact.job_work_from_home = 'Yes'
GROUP BY skills_dim.skill_id,
    skills_dim.skills
ORDER BY demand_count DESC,
    avg_salary DESC
LIMIT 25;
/*
 | Rank | Skill         | Demand | Avg Salary | Optimal Score |       Tier      |
 | :--: | ------------- | :----: | :--------: | :-----------: | :-------------: |
 |   1  |   SQL         |   398  |   $97,237  |      92.2     |   🥇 Must-Have  |
 |   2  |   Python      |   236  |   $101,397 |      73.6     |   🥇 Must-Have  |
 |   3  |   Tableau     |   230  |   $99,288  |      71.9     |   🥇 Must-Have  |
 |   4  |   Excel       |   256  |   $87,288  |      70.0     |   🥇 Must-Have  |
 |   5  |   R           |   148  |   $100,499 |      62.2     |   🥇 Must-Have  |
 |   6  |   Power BI    |   110  |   $97,431  |      56.1     |  🥈 High Value  |
 |   7  |   Snowflake   |   37   |   $112,948 |      53.6     |  🥈 High Value  |
 |   8  |   Go          |   27   |   $115,320 |      53.4     |  🥈 High Value  |
 |   9  |   Azure       |   34   |   $111,225 |      52.5     |  🥈 High Value  |
 |  10  |   Hadoop      |   22   |   $113,193 |      51.8     |  🥈 High Value  |
 |  11  |   Looker      |   49   |   $103,795 |      51.2     |  🥉 Solid Pick  |
 |  12  |   AWS         |   32   |   $108,317 |      51.0     |  🥉 Solid Pick  |
 |  13  |   SAS         |   63   |   $98,902  |      50.8     |  🥉 Solid Pick  |
 |  14  |   Oracle      |   37   |   $104,534 |      50.0     |  🥉 Solid Pick  |
 |  15  |   Jira        |   20   |   $104,918 |      48.0     |  🥉 Solid Pick  |
 |  16  |   SQL Server  |   35   |   $97,786  |      46.8     | 📌 Nice-to-Have |
 |  17  |   PowerPoint  |   58   |   $88,701  |      45.7     | 📌 Nice-to-Have |
 |  18  |   Flow        |   28   |   $97,200  |      45.7     | 📌 Nice-to-Have |
 |  19  |   JavaScript  |   20   |   $97,587  |      44.8     | 📌 Nice-to-Have |
 |  20  |   SPSS        |   24   |   $92,170  |      43.0     | 📌 Nice-to-Have |
 |  21  |   Word        |   48   |   $82,576  |      41.8     | 📌 Nice-to-Have |
 |  22  |   VBA         |   24   |   $88,783  |      41.5     | 📌 Nice-to-Have |
 |  23  |   Sheets      |   32   |   $86,088  |      41.3     | 📌 Nice-to-Have |
 |  24  |   SharePoint  |   18   |   $81,634  |      37.7     | 📌 Nice-to-Have |
 
 These 5 skills give you the broadest employability
 --------------------------------------------------
 | Skill       | Why It Matters                                                                         |
 | ----------- | -------------------------------------------------------------------------------------- |
 |   SQL       | The foundation. Required in 398 postings — nearly 4× more than any other skill.        |
 |   Python    | The Swiss Army knife. Automation, ML, data wrangling — $101K average.                  |
 |   Tableau   | The visualization standard. 230 postings, nearly tied with Python.                     |
 |   Excel     | High demand (256) but lower pay ($87K). Still non-negotiable for most roles.           |
 |   R         | Statistical powerhouse. 148 postings, $100K average — great for research-heavy roles.  |
 
 Lower demand but higher salaries
 --------------------------------
 | Skill         | Avg Salary | Why Learn It                                                      |
 | ------------- | :--------: | ----------------------------------------------------------------- |
 |   Go          |    $115K   | Niche but lucrative — fintech and data engineering hybrids        |
 |   Snowflake   |    $113K   | Fastest-growing cloud data warehouse                              |
 |   Hadoop      |    $113K   | Big data processing at scale                                      |
 |   Azure       |    $111K   | Microsoft's cloud ecosystem (enterprise-heavy)                    |
 |   Power BI    |    $97K    | Microsoft's Tableau competitor — strong in corporate environments |
 
 💡 Key Insight: Cloud & Big Data commands the highest average salary ($110K) but has the lowest demand.This is the classic scarcity premium — fewer people have these skills,
 so they earn more.
 
 */