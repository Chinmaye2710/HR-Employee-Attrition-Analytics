SELECT 'HR' AS Table_Name ,COUNT(*) AS Row_Count 
FROM HR 
UNION ALL
SELECT 'Fact Attrition', COUNT(*)  
FROM Fact_Attrition
UNION ALL

SELECT 'Dim_Satisfaction', COUNT(*) 
FROM Dim_Satisfaction
UNION ALL

SELECT 'Dim_Job', COUNT(*) 
FROM Dim_Job
UNION ALL

SELECT 'Dim_Employee',COUNT(*) 
FROM Dim_Employee
UNION ALL

SELECT 'dim_Edu', COUNT(*) 
FROM Dim_Edu
UNION ALL

SELECT 'Dim_Compensation' ,COUNT(*) 
FROM Dim_Compensation;


SELECT COUNT(*) AS Joined_Rows
FROM Fact_Attrition f
JOIN Dim_employee e
ON f.Employee_ID=e.Employee_ID
JOIN Dim_Job j
ON f.Employee_ID=j.Employee_ID
JOIN Dim_Satisfaction s
ON f.Employee_ID=s.Employee_ID
JOIN Dim_Edu d
ON f.Employee_ID=d.Employee_ID
JOIN Dim_compensation c
ON f.Employee_ID=c.Employee_ID;
