/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS(
    SELECT 
        job_id,
        job_title,
        job_location,    
        salary_year_avg,
        name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE   
        (job_title_short = 'Data Analyst' OR job_title_short= 'Software Engineer') AND 
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 100
)
SELECT 
    top_paying_jobs.*, -- selecting all columns from the top_paying_job table
    skills,
    type 
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
LIMIT 10

/* 
RESULTS: 
    [
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "job_location": "Anywhere",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "sql",
            "type": "programming"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "job_location": "Anywhere",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "python",
            "type": "programming"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "job_location": "Anywhere",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "r",
            "type": "programming"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "job_location": "Anywhere",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "azure",
            "type": "cloud"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "job_location": "Anywhere",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "databricks",
            "type": "cloud"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "job_location": "Anywhere",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "aws",
            "type": "cloud"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "job_location": "Anywhere",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "pandas",
            "type": "libraries"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "job_location": "Anywhere",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "pyspark",
            "type": "libraries"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "job_location": "Anywhere",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "jupyter",
            "type": "libraries"
        },
        {
            "job_id": 552322,
            "job_title": "Associate Director- Data Insights",
            "job_location": "Anywhere",
            "salary_year_avg": "255829.5",
            "company_name": "AT&T",
            "skills": "excel",
            "type": "analyst_tools"
        }
    ]
**/