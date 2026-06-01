SELECT
		f.Employee_Id,
		f.Attrition_Flag,
		j.Department,
		j.JobRole,
		j.JobLevel,
		j.Job_Type_,
		j.OverTime,
		j.BusinessTravel_Type,
		e.Gender,
		e.MaritalStatus,
		e.Age,
		e.Age_Group
INTO AttritionBase
FROM Fact_Attrition f
JOIN Dim_Job j
ON f.Employee_Id=j.Employee_Id 
JOIN Dim_Employee e
ON f.Employee_Id=e.Employee_Id
-----------------------------------------
--Overall Attrition Rate
SELECT
	COUNT(*) AS Total_Employee,
	SUM(Attrition_Flag) AS Attrited,
	COUNT(*)-SUM(Attrition_Flag) AS Active,
	CAST(
			SUM(Attrition_Flag)*100.0 / COUNT(*) AS DECIMAL(10,2)
		)AS Attrition_Rate
FROM AttritionBase
;
--Attrition Rate By Dept
SELECT
	Department,
	COUNT(*) AS Total_Employee,
	SUM(Attrition_Flag) AS Attrited,
	CAST(
			SUM(Attrition_Flag)*100.0 / COUNT(*) AS DECIMAL(10,2)
		)AS Attrition_Rate

FROM AttritionBase
GROUP BY Department
ORDER BY Attrition_Rate DESC
;
--Attrition by Jobrole
SELECT
	JobRole,
	COUNT(*) AS Total_Employee,
	SUM(Attrition_Flag) AS Attrited,
	CAST(
			SUM(Attrition_Flag)*100.0 / COUNT(*) AS DECIMAL(10,2)
		)AS Attrition_Rate

FROM AttritionBase
GROUP BY JobRole
ORDER BY Attrition_Rate DESC
;
--Attrition BY OverTime
SELECT
	OverTime,
	COUNT(*) AS Total_Employee,
	SUM(Attrition_Flag) AS Attrited,
	CAST(
			SUM(Attrition_Flag)*100.0 / COUNT(*) AS DECIMAL(10,2)
		)AS Attrition_Rate

FROM AttritionBase
GROUP BY OverTime
ORDER BY Attrition_Rate DESC
;

---Attrition By Business Travel 
SELECT
	BusinessTravel_Type,
	COUNT(*) AS Total_Employee,
	SUM(Attrition_Flag) AS Attrited,
	CAST(
			SUM(Attrition_Flag)*100.0 / COUNT(*) AS DECIMAL(10,2)
		)AS Attrition_Rate

FROM AttritionBase
GROUP BY BusinessTravel_Type
ORDER BY Attrition_Rate DESC
;

-----Attrition By Job Level
SELECT
	Job_Type_,
	COUNT(*) AS Total_Employee,
	SUM(Attrition_Flag) AS Attrited,
	CAST(
			SUM(Attrition_Flag)*100.0 / COUNT(*) AS DECIMAL(10,2)
		)AS Attrition_Rate

FROM AttritionBase
GROUP BY Job_Type_
ORDER BY Attrition_Rate DESC
;

---Attrition Rate By DeptxOverTime
SELECT
	Department,
	OverTime,
	COUNT(*) AS Total_Employee,
	SUM(Attrition_Flag) AS Attrited,
	CAST(
			SUM(Attrition_Flag)*100.0 / COUNT(*) AS DECIMAL(10,2)
		)AS Attrition_Rate

FROM AttritionBase
GROUP BY Department,OverTime
ORDER BY Attrition_Rate DESC
;

----Attrition By Age Group
SELECT
	Age_Group,
	COUNT(*) AS Total_Employee,
	SUM(Attrition_Flag) AS Attrited,
	CAST(
		SUM(Attrition_Flag)*100.0 / COUNT(*) AS DECIMAL(10,2)
		) AS Attrition_Rate
FROM AttritionBase
GROUP BY Age_Group
ORDER BY Attrition_Rate DESC
;
--- Department Ranking x Company Average
WITH DeptMetrics AS
(
    SELECT
        Department,
        CAST(
            SUM(Attrition_Flag)*100.0/COUNT(*)
            AS DECIMAL(10,2)
        ) AS Attrition_Rate
    FROM AttritionBase
    GROUP BY Department
),

CompanyMetrics AS
(
    SELECT
        CAST(
            SUM(Attrition_Flag)*100.0/COUNT(*)
            AS DECIMAL(10,2)
        ) AS Company_Average
    FROM AttritionBase
)

SELECT
    d.Department,
    d.Attrition_Rate,
    c.Company_Average,

    RANK() OVER(
        ORDER BY d.Attrition_Rate DESC
    ) AS Dept_Rank,

    CASE
        WHEN d.Attrition_Rate > c.Company_Average
            THEN 'Above Average'
        ELSE 'Below Average'
    END AS Status

FROM DeptMetrics d
CROSS JOIN CompanyMetrics c
;

-----------Top Risk Roles With in Each Dept
WITH RoleMetrics AS
(
	SELECT
		Department,
		JobRole,

		COUNT(*) AS Total_Employee,
		SUM(Attrition_Flag) AS Attrited,
		CAST(
			SUM(Attrition_flag)*100.0/ COUNT(*) AS DECIMAL(10,2)
		) AS Attrition_Rate
	FROM AttritionBase
	GROUP BY Department,JobRole
)
SELECT*
FROM(
SELECT
	Department,
	Jobrole,
	Total_Employee,
	Attrited,
	Attrition_Rate,

	ROW_NUMBER() OVER(
					PARTITION BY Department
					ORDER BY Attrition_Rate DESC
					) AS Role_Rank
FROM RoleMetrics
)T
WHERE Role_Rank<=3
ORDER BY Department,Role_Rank


