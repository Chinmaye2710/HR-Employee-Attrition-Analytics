SELECT
	f.Employee_Id,
	f.Attrition_Flag,

	c.MonthlyIncome,
	c.Salary_Band,
	c.Salary_Hike,
	c.PercentSalaryHike,
	c.StockOptionLevel,
	c.StockOption_Level_Name,
	c.PerformanceRating,
	j.OverTime,
	e.Age_Group
INTO CompensationBase
FROM Fact_Attrition f 

JOIN Dim_Compensation c
ON f.Employee_Id=c.Employee_Id

JOIN Dim_Job j
ON f.Employee_Id=j.Employee_Id

JOIN Dim_Employee e
ON f.Employee_Id=e.Employee_Id
;

-----------------------------------

----Attrition by Stock Option Level


SELECT
	StockOption_Level_Name,
	COUNT(*) AS Total_Employee,
	SUM(Attrition_Flag) AS Attrited ,
	CAST(
		SUM(Attrition_Flag)*100.0/COUNT(*) AS DECIMAL(10,2) 
		) AS Attrition_Rate
FROM CompensationBase
GROUP BY StockOption_Level_Name
ORDER BY Attrition_Rate DESC
;
----Attrition Rate By Performance
SELECT
	PerformanceRating,
	COUNT(*) AS Total_Employee,
	SUM(Attrition_Flag) AS Attrited ,
	CAST(
		SUM(Attrition_Flag)*100.0/COUNT(*) AS DECIMAL(10,2) 
		) AS Attrition_Rate
FROM CompensationBase
GROUP BY PerformanceRating
ORDER BY Attrition_Rate DESC
;

---Attrition Rate By Salary Hike
SELECT
	Salary_Hike,
	COUNT(*) AS Total_Employee,
	SUM(Attrition_Flag) AS Attrited ,
	CAST(
		SUM(Attrition_Flag)*100.0/COUNT(*) AS DECIMAL(10,2) 
		) AS Attrition_Rate
FROM CompensationBase
GROUP BY Salary_Hike
ORDER BY Attrition_Rate DESC
;

----Income Band Analysis
SELECT
	Salary_Band,
	COUNT(*) AS Total_Employee,
	SUM(Attrition_Flag) AS Attrited ,
	CAST(
		SUM(Attrition_Flag)*100.0/COUNT(*) AS DECIMAL(10,2) 
		) AS Attrition_Rate
FROM CompensationBase
GROUP BY Salary_Band
ORDER BY Attrition_Rate DESC
;

---------------Income Band × Overtime
SELECT
	Salary_Band,

	OverTime,

	COUNT(*) Total_Employee,
	SUM(Attrition_Flag) Attrited,

	CAST(
		SUM(Attrition_Flag)*100.0/COUNT(*) AS DECIMAL(10,2)
		) AS Attrition_Rate
FROM CompensationBase
GROUP BY Salary_Band,OverTime
ORDER BY Attrition_Rate DESC
;
