
--Educational Category
ALTER TABLE Dim_Edu
ADD Education_Level VARCHAR(30);

UPDATE Dim_Edu
SET Education_Level=
	CASE
		WHEN Education=1 THEN 'Below College'
		WHEN Education=2 THEN 'College'
		WHEN Education=3 THEN 'Bachelor'
		WHEN Education=4 THEN 'Master'
		WHEN Education=5 THEN 'Doctor'
	END;

-- Job_SatisFaction_Category

ALTER TABLE Dim_Satisfaction
ADD
    JobSatisfaction_Level VARCHAR(20),
    EnvironmentSatisfaction_Level VARCHAR(20),
    RelationshipSatisfaction_Level VARCHAR(20),
    WorkLifeBalance_Level VARCHAR(20),
    JobInvolvement_Level VARCHAR(20);

UPDATE Dim_Satisfaction
SET
    JobSatisfaction_Level =
        CASE
            WHEN JobSatisfaction = 1 THEN 'Low'
            WHEN JobSatisfaction = 2 THEN 'Medium'
            WHEN JobSatisfaction = 3 THEN 'High'
            WHEN JobSatisfaction = 4 THEN 'Very High'
        END,

    EnvironmentSatisfaction_Level =
        CASE
            WHEN EnvironmentSatisfaction = 1 THEN 'Low'
            WHEN EnvironmentSatisfaction = 2 THEN 'Medium'
            WHEN EnvironmentSatisfaction = 3 THEN 'High'
            WHEN EnvironmentSatisfaction = 4 THEN 'Very High'
        END,

    RelationshipSatisfaction_Level =
        CASE
            WHEN RelationshipSatisfaction = 1 THEN 'Low'
            WHEN RelationshipSatisfaction = 2 THEN 'Medium'
            WHEN RelationshipSatisfaction = 3 THEN 'High'
            WHEN RelationshipSatisfaction = 4 THEN 'Very High'
        END,

    WorkLifeBalance_Level =
        CASE
            WHEN WorkLifeBalance = 1 THEN 'Poor'
            WHEN WorkLifeBalance = 2 THEN 'Fair'
            WHEN WorkLifeBalance = 3 THEN 'Good'
            WHEN WorkLifeBalance = 4 THEN 'Excellent'
        END,

    JobInvolvement_Level =
        CASE
            WHEN JobInvolvement = 1 THEN 'Low'
            WHEN JobInvolvement = 2 THEN 'Medium'
            WHEN JobInvolvement = 3 THEN 'High'
            WHEN JobInvolvement = 4 THEN 'Very High'
        END;


-- Job Level
ALTER TABLE Dim_Job
ADD Job_Type_ VARCHAR(20);

UPDATE Dim_Job
SET Job_Type_ =
CASE
    WHEN JobLevel = 1 THEN 'Entry Level'
    WHEN JobLevel = 2 THEN 'Junior'
    WHEN JobLevel = 3 THEN 'Mid Level'
    WHEN JobLevel = 4 THEN 'Senior'
    WHEN JobLevel = 5 THEN 'Executive'
END;



--compensation
ALTER TABLE Dim_Compensation
ADD StockOption_Level_Name VARCHAR(20);
UPDATE Dim_Compensation
SET StockOption_Level_Name =
CASE
    WHEN StockOptionLevel = 0 THEN 'None'
    WHEN StockOptionLevel = 1 THEN 'Low'
    WHEN StockOptionLevel = 2 THEN 'Medium'
    WHEN StockOptionLevel = 3 THEN 'High'
END;

--BusinessTravel_Type
ALTER TABLE Dim_Job
ADD BusinessTravel_Type VARCHAR(20);

UPDATE Dim_Job
SET BusinessTravel_Type =
CASE
    WHEN BusinessTravel = 'Non-Travel' THEN 'No Travel'
    WHEN BusinessTravel = 'Travel_Rarely' THEN 'Rare Travel'
    WHEN BusinessTravel = 'Travel_Frequently' THEN 'Frequent Travel'
END;


SELECT*
FROM [dbo].[Dim_Job]

ALTER TABLE Dim_Compensation 
ADD PerformanceRating INT;
UPDATE c
SET c.PerformanceRating=h.PerformanceRating
FROM Dim_Compensation c
JOIN HR h
ON c.Employee_Id=h.Employee_ID;

ALTER TABLE Dim_Compensation
ADD  Salary_Hike VARCHAR(20);

UPDATE Dim_Compensation
SET 
    Salary_Hike=
    CASE 
		WHEN PercentSalaryHike<=14 THEN 'LOW HIKE'
		WHEN PercentSalaryHike<=18 THEN 'MEDIUM HIKE'
	ELSE 'HIGH HIKE'
	END;

SELECT*
FROM [dbo].[Dim_Compensation]