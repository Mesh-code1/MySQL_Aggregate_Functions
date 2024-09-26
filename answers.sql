USE hospital_db;

-- ## Part 1: Basic Aggregate Functions
-- **1.1).** Write a query to find the total number of patient admissions in the admissions table.
SELECT COUNT(*) AS total_admissions
FROM admissions;

-- **1.2).** Write a query to calculate the average length of stay (difference between discharge date and admission date) for all patients.
SELECT AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay
FROM admissions;

-- ## Part 2: Grouping Data
-- **2.1).** Write a query to group admissions by primary_diagnosis and calculate the total number of admissions for each diagnosis.
SELECT primary_diagnosis, COUNT(*) AS total_admissions
FROM admissions
GROUP BY primary_diagnosis;

-- **2.2).** Write a query to group admissions by service and calculate the average length of stay for each service.
SELECT service, AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay
FROM admissions
GROUP BY service;

-- **2.3).** Write a query to group discharges by discharge_disposition and count the number of discharges in each category (e.g., Home, Expired, Transfer).
SELECT discharge_disposition, COUNT(*) AS total_discharges
FROM discharges
GROUP BY discharge_disposition;

-- ## Part 3: Combining Aggregates and Filtering
-- **3.1).** Write a query to group admissions by service and show the services where the total number of admissions is greater than 5.
SELECT service, COUNT(*) AS total_admissions
FROM admissions
GROUP BY service
HAVING COUNT(*) > 5;

-- **3.2).** Write a query to find the average length of stay for patients admitted with a primary diagnosis of "Stroke" in the admissions table.
SELECT AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay
FROM admissions
WHERE primary_diagnosis = 'Stroke';

-- ## Part 4: Advanced Grouping and Summarizing
-- **4.1).** Write a query to group emergency department visits (ed_visits) by acuity and calculate the total number of visits for each acuity level.
SELECT acuity, COUNT(*) AS total_visits
FROM ed_visits
GROUP BY acuity;

-- **4.2).** Write a query to group admissions by primary_diagnosis and service, showing the total number of admissions for each combination.
SELECT primary_diagnosis, service, COUNT(*) AS total_admissions
FROM admissions
GROUP BY primary_diagnosis, service;

-- ## Part 5: Practical Financial Analysis
-- **5.1).** Write a query to group admissions by month (using the admission_date) and calculate the total number of admissions per month.
SELECT MONTH(admission_date) AS admission_month, COUNT(*) AS total_admissions
FROM admissions
GROUP BY MONTH(admission_date);

-- **5.2).** Write a query to find the maximum length of stay for each primary_diagnosis in the admissions table.
SELECT primary_diagnosis, MAX(DATEDIFF(discharge_date, admission_date)) AS max_length_of_stay
FROM admissions
GROUP BY primary_diagnosis;

-- ## Bonus Challenge (optional)
-- Write a query to group admissions by service and calculate both the total and average length of stay for each service, ordered by the highest average length of stay.
SELECT service, 
       SUM(DATEDIFF(discharge_date, admission_date)) AS total_length_of_stay,
       AVG(DATEDIFF(discharge_date, admission_date)) AS avg_length_of_stay
FROM admissions
GROUP BY service
ORDER BY avg_length_of_stay DESC;