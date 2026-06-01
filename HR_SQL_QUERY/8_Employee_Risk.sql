SELECT
	f.Employee_Id,
	f.Attrition_Flag,
	
	e.Age_Group,
	e.MaritalStatus,
	
	j.OverTime,
	j.BusinessTravel_Type,
	j.Job_Type_,

	c.MonthlyIncome,
	c.Salary_Band,
	c.StockOption_Level_Name,

		(
		CASE 
			WHEN j.OverTime = 'Yes' THEN 3
			ELSE 0
		END

		+
		
		CASE 
			WHEN c.Salary_Band='LOW INCOME' THEN 3
			ELSE 0
		END 
		
		+
		CASE 
			WHEN e.Age_Group='18-25' THEN 2
			ELSE 0
		END 

		+

		CASE 
			WHEN e.MaritalStatus='Single' THEN 2
			ELSE 0
		END 
		+
		CASE 
			WHEN j.BusinessTravel_Type='Frequent Travel' THEN 2
			ELSE 0
		END 
		+
		CASE 
			WHEN j.Job_Type_='Entry Level' THEN 2
		ELSE 0
		END
	) AS Risk_score



INTO Risk_Base
FROM Fact_Attrition f

JOIN Dim_Employee e
ON f.Employee_Id=e.Employee_Id

JOIN Dim_Job j
ON f.Employee_Id=j.Employee_Id

JOIN Dim_Compensation c
ON f.Employee_Id=c.Employee_Id
;
------------------------------------------


------MAX, MIN, AVG RISK

SELECT
    MIN(Risk_Score) AS Min_Score,
    MAX(Risk_Score) AS Max_Score,
    AVG(Risk_Score) AS Avg_Score
FROM Risk_Base;


SELECT
	Risk_Score,
	COUNT(*) AS Total_employee
FROM Risk_Base
GROUP BY Risk_score
ORDER BY Risk_score DESC

-----Risk Category
ALTER TABLE Risk_Base
ADD Risk_Level VARCHAR(20);

UPDATE Risk_Base
SET Risk_Level=
	CASE 
		WHEN Risk_score>=7 THEN 'HIGH RISK'
		WHEN Risk_score>=4 THEN 'MEDIUM RISK'
		ELSE 'LOW RISK'
	END
;

---------- 
SELECT
	Risk_Level,
	COUNT(*) Total_Employee,
	SUM(Attrition_Flag) AS Attrited,
	CAST(
		SUM(Attrition_Flag)*100.0 / COUNT(*) AS DECIMAL(10,2) 
		) AS Attrition_Rate
FROM Risk_Base
GROUP BY Risk_Level
ORDER BY Attrition_Rate DESC
;
