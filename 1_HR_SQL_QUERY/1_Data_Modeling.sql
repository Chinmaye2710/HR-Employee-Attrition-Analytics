SELECT
	Employee_Id,
	Attrition,
	Attrition_Flag,
	MonthlyIncome,
	PercentSalaryHike,
	PerformanceRating,
	JobInvolvement,
	StockOptionLevel,
	NumCompaniesWorked,
	TotalWorkingYears,
	YearsAtcompany,
	YearsInCurrentRole,
	YearsSinceLastPromotion,
	YearsWithCurrManager,
	TrainingTimesLastYear
INTO Fact_Attrition
FROM HR;


SELECT
	Employee_Id,
	Age,
	Gender,
	MaritalStatus,
	Age_Group,
	DistanceFromHome
INTO Dim_Employee
FROM HR;


SELECT
	Employee_Id,
	Department,
	JobRole,
	JobLevel,
	BusinessTravel,
	OverTime
INTO Dim_Job
FROM HR;


SELECT
	Employee_Id,
	Education,
	EducationField,
	TrainingTimesLastYear
INTO Dim_Edu
FROM hr;


SELECT
	Employee_Id,
	JobSatisfaction,
	EnvironmentSatisfaction,
	RelationshipSatisfaction,
	WorkLifeBalance,
	JobInvolvement
INTO Dim_Satisfaction
FROM HR;

SELECT
	Employee_Id,
	MonthlyIncome,
	Salary_Band,
	PercentSalaryHike,
	StockOptionLevel
INTO Dim_Compensation
FROM HR;

SELECT*
FROM HR;
