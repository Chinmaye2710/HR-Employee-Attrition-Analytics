SELECT
	f.Attrition_Flag,
	f.Employee_Id,
	e.Age,
	e.Age_Group,
	e.Gender,
	e.MaritalStatus,
	d.Education,
	d.Education_Level,
	d.EducationField
INTO DemoBase
FROM Fact_Attrition f
JOIN Dim_Employee e
ON f.Employee_Id=e.Employee_Id
JOIN Dim_Edu d
ON f.Employee_Id=d.Employee_Id
;

-------Total WorkForce by Gender
SELECT
	Gender,
	COUNT(*) Total_Employee,
	CAST( COUNT(*)*100.0 / SUM(COUNT(*)) OVER() AS DECIMAL(10,2)) AS WorkForce_Percentage
FROM DemoBase
GROUP BY Gender
ORDER BY Total_Employee
;

-----Attrition Rate By Gender
SELECT
	Gender,
	COUNT(*) Total_Employee,
	SUM(Attrition_flag) Attired,
	CAST(
		SUM(Attrition_flag)*100.0/ COUNT(*) AS DECIMAL(10,2)
	) AS Attrition_Rate
FROM DemoBase
GROUP BY Gender
ORDER BY Attrition_Rate
;

------Attrition Rate by Marital Rate
SELECT
	MaritalStatus,
	COUNT(*) Total_Employee,
	SUM(Attrition_flag) Attired,
	CAST(
		SUM(Attrition_flag)*100.0/ COUNT(*) AS DECIMAL(10,2)
	) AS Attrition_Rate
FROM DemoBase
GROUP BY MaritalStatus
ORDER BY Attrition_Rate DESC
;

-----Attrition by Education Level
SELECT
	Education_Level,
	COUNT(*) Total_Employee,
	SUM(Attrition_flag) Attired,
	CAST(
		SUM(Attrition_flag)*100.0/ COUNT(*) AS DECIMAL(10,2)
	) AS Attrition_Rate
FROM DemoBase
GROUP BY Education_Level
ORDER BY Attrition_Rate DESC
;

-------Attrition by Education Field
SELECT
	EducationField,
	COUNT(*) Total_Employee,
	SUM(Attrition_flag) Attired,
	CAST(
		SUM(Attrition_flag)*100.0/ COUNT(*) AS DECIMAL(10,2)
	) AS Attrition_Rate
FROM DemoBase
GROUP BY EducationField
ORDER BY Attrition_Rate DESC
;

-------Gender × Marital Status
SELECT
	Gender,
	MaritalStatus,
	COUNT(*) Total_Employee,
	SUM(Attrition_flag) Attired,
	CAST(
		SUM(Attrition_flag)*100.0/ COUNT(*) AS DECIMAL(10,2)
	) AS Attrition_Rate
FROM DemoBase
GROUP BY Gender,MaritalStatus
ORDER BY Attrition_Rate DESC
;

------Age x Education Field Rate
WITH AgeEdu AS(
SELECT 
	Age_Group,
	EducationField,
	COUNT(*) Total_Employee,
	SUM(Attrition_flag) Attired,
	CAST(
		SUM(Attrition_flag)*100.0/ COUNT(*) AS DECIMAL(10,2)
	) AS Attrition_Rate
FROM DemoBase
GROUP BY Age_Group, EducationField
HAVING COUNT(*)>=30
)

SELECT*
FROM(
SELECT
	*,
	ROW_NUMBER() OVER(
					PARTITION BY Age_Group
					ORDER BY Attrition_Rate DESC
					) AS Rank_No
FROM AgeEdu
)T
WHERE Rank_No<=3
ORDER BY Age_Group,Rank_No