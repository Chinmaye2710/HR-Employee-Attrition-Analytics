# HR Attrition Analytics & Risk Segmentation

An end-to-end HR Analytics project built using SQL Server and Power BI to identify employee attrition drivers, analyze workforce demographics, evaluate compensation risks, and develop a custom employee risk segmentation framework.

---

## Project Overview

Employee attrition significantly impacts organizational productivity, hiring costs, and workforce stability.

This project transforms raw HR employee data into a dimensional analytics solution using SQL Server and Power BI. The analysis focuses on understanding:

* What is happening?
* Why employees are leaving?
* Who is leaving?
* How compensation impacts attrition?
* Which employees are most likely to leave?

The project culminates in a custom Risk Segmentation Model that classifies employees into Low, Medium, and High-Risk groups based on multiple attrition drivers.

---

## Business Objectives

* Identify key drivers of employee attrition
* Analyze workforce demographics
* Evaluate compensation-related attrition risks
* Build a scalable dimensional data model
* Develop an employee risk scoring framework
* Deliver actionable insights through interactive dashboards

---

## Tools & Technologies

* SQL Server
* T-SQL
* Power BI
* DAX
* Star Schema Data Modeling
* Fact & Dimension Tables
* Window Functions
* GitHub

---

## Data Modeling

The dataset was transformed into a Star Schema to support scalable analytics and reporting.

### Fact Table

* Fact_Attrition

### Dimension Tables

* Dim_Employee
* Dim_Job
* Dim_Edu
* Dim_Compensation
* Dim_Satisfaction

### Analytical Layer

* Risk_Base
* Risk Segmentation Framework

<img width="1465" height="738" alt="DataModel" src="https://github.com/user-attachments/assets/92146bc0-9e43-48de-b46a-1237af072282" />
---

## Dashboard Pages

### 1. Executive Overview

Provides a high-level view of workforce attrition.

KPIs:

* Total Employees
* Active Employees
* Employees Left
* Attrition Rate

Analysis:

* Department Attrition
* Job Role Attrition
* Overtime Impact

  <img width="1302" height="738" alt="1_EXECUTIVE DASHBOARD" src="https://github.com/user-attachments/assets/1c29ccad-dd9c-4bb9-bc68-339f49a7f662" />


---

### 2. Attrition Drivers

Analyzes the major factors contributing to employee turnover.

Analysis:

* Overtime
* Business Travel
* Job Type
* Department × Overtime Analysis
* High-Risk Roles

  <img width="1319" height="741" alt="2_Attrition_Drivers" src="https://github.com/user-attachments/assets/fe9a4e3b-df3c-4c78-9cc9-1b6a7d872b2e" />


---

### 3. Demographic Analysis

Examines attrition across employee demographics.

Analysis:

* Gender
* Marital Status
* Education Level
* Education Field
* Age Group
* Demographic Cross Analysis

  <img width="1295" height="730" alt="3_Demographic_Analysis" src="https://github.com/user-attachments/assets/81b62e38-25c9-49b2-b052-04866e1e408f" />


---

### 4. Compensation Analysis

Evaluates compensation-related attrition factors.

Analysis:

* Salary Bands
* Salary Hike Bands
* Stock Option Levels
* Performance Ratings
* Income × Overtime Analysis


<img width="1301" height="734" alt="4_Compensation_Analysis" src="https://github.com/user-attachments/assets/e03dd8c2-b9ce-44ad-9fc7-aaee5021f23c" />

---

### 5. Risk Segmentation

Custom employee risk scoring framework developed using multiple attrition drivers.

Risk Factors:

* Overtime
* Salary Band
* Age Group
* Marital Status
* Business Travel
* Job Type

Outputs:

* Risk Score
* Risk Level
* Risk Distribution
* Risk Lift Analysis

  <img width="1296" height="737" alt="5_RiskSegmentation_Analysis" src="https://github.com/user-attachments/assets/3de92ec4-ef4a-46e5-967a-fa94bf45c3f1" />


---

## Key Business Insights

### Attrition Drivers

* Employees working overtime show 30.53% attrition compared to 10.44% without overtime.
* Frequent travelers experience 24.91% attrition.
* Entry-level employees show the highest attrition at 26.34%.

### Demographics

* Single employees experience 25.53% attrition.
* Employees aged 18–25 show the highest turnover.
* Human Resources education backgrounds show 25.93% attrition.

### Compensation

* Employees with no stock options show 24.41% attrition.
* Low-income employees experience 21.76% attrition.
* Low-income employees working overtime show 42.93% attrition.

### Risk Segmentation

* High-Risk Attrition: 61.61%
* Medium-Risk Attrition: 24.51%
* Low-Risk Attrition: 7.08%

High-risk employees leave 3.82x more frequently than the company average.

---

## Technical Highlights

* Star Schema Design
* Fact & Dimension Modeling
* SQL Data Transformation
* Window Functions
* CASE-Based Segmentation
* Advanced Aggregations
* DAX Measures
* KPI Development
* Conditional Formatting
* Risk Scoring Framework
* Risk Segmentation Analytics

---

## Repository Structure

```text
HR-Attrition-Analytics-Risk-Segmentation
│
├── Dataset
├── SQL
├── PowerBI
├── Dashboard_Screenshots
├── Data_Model
└── README.md
```

---

## Skills Demonstrated

* SQL Server
* T-SQL
* Power BI
* DAX
* Data Modeling
* Business Intelligence
* HR Analytics
* Data Visualization
* Risk Analysis
* Dashboard Development
* Analytical Problem Solving

---

## Author

**Chinmaye Datta Kasarla**

Aspiring Data Analyst | SQL | Power BI | Excel | Business Intelligence
