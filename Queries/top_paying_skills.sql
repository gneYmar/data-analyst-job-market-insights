--- Question: What are the top 25 highest paying skills for data analysts?
SELECT skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;
/*
 | Rank | Skill            | Avg Salary |
 | :--: | ---------------- | :--------: |
 |   1  |   SVN            |   $400,000 |
 |   2  |   Solidity       |   $179,000 |
 |   3  |   Couchbase      |   $160,515 |
 |   4  |   DataRobot      |   $155,486 |
 |   5  |   Go (Golang)    |   $155,000 |
 |   6  |   MXNet          |   $149,000 |
 |   7  |   dplyr          |   $147,633 |
 |   8  |   VMware         |   $147,500 |
 |   9  |   Terraform      |   $146,734 |
 |  10  |   Twilio         |   $138,500 |
 |  11  |   GitLab         |   $134,126 |
 |  12  |   Kafka          |   $129,999 |
 |  13  |   Puppet         |   $129,820 |
 |  14  |   Keras          |   $127,013 |
 |  15  |   PyTorch        |   $125,226 |
 |  16  |   Perl           |   $124,686 |
 |  17  |   Ansible        |   $124,370 |
 |  18  |   Hugging Face   |   $123,950 |
 |  19  |   TensorFlow     |   $120,647 |
 |  20  |   Cassandra      |   $118,407 |
 |  21  |   Notion         |   $118,092 |
 |  22  |   Atlassian      |   $117,966 |
 |  23  |   Bitbucket      |   $116,712 |
 |  24  |   Airflow        |   $116,387 |
 |  25  |   Scala          |   $115,480 |
 
 | Category                       | Skills                                                        | Pattern                                                       |
 | ------------------------------ | ------------------------------------------------------------- | ------------------------------------------------------------- |
 |   Version Control / DevOps     | SVN, GitLab, Terraform, Puppet, Ansible, Bitbucket, Atlassian | Senior roles require infrastructure and collaboration tooling |
 |   Blockchain / Emerging Tech   | Solidity, Couchbase                                           | Niche, high-value specialization                              |
 |   Machine Learning / AI        | MXNet, Keras, PyTorch, TensorFlow, Hugging Face               | ML engineering hybrid roles command premium salaries          |
 |   Data Engineering             | Kafka, Airflow, Cassandra, Scala, DataRobot                   | Pipeline and big-data skills are highly compensated           |
 |   Programming Languages        | Go, Perl, dplyr (R)                                           | Less common languages = scarcity premium                      |
 
 KEY INSIGHTS:
 - `svn` at 400,000 is an outlier — verify data quality.
 - Highest genuine pays: `solidity`, `couchbase`, `datarobot`, `golang`.
 - Top skills are specialized (blockchain, ML infra, backend) — specialize to maximize pay.
 */