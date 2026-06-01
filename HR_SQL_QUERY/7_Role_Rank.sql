CREATE VIEW vw_TopRiskRoles AS
WITH RoleMetrics AS
(
    SELECT
        --Employee_Id
        Department,
        JobRole,
        COUNT(*) AS Total_Employee,
        SUM(Attrition_Flag) AS Attrited,
        CAST(
            SUM(Attrition_Flag)*100.0/COUNT(*) AS DECIMAL(10,2)
        ) AS Attrition_Rate
    FROM AttritionBase
    GROUP BY Department, JobRole
)

SELECT
    *,
    ROW_NUMBER() OVER(
        PARTITION BY Department
        ORDER BY Attrition_Rate DESC
    ) AS Role_Rank
FROM RoleMetrics;

