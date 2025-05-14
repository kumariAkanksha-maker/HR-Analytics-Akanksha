SQL Analysis

Structured Query Language (SQL) was used to analyze employee attrition across multiple dimensions. Below are the key queries:

1. Overall Attrition Summary

Calculates total employees, total attrition cases, and overall attrition rate:

SELECT 
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2
    ) AS Attrition_Rate_Percentage
FROM HR_EmployeeData;

2. Attrition by Department

Displays attrition distribution across departments:

SELECT 
    Department, 
    COUNT(*) AS Total_Employees, 
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2
    ) AS Department_Attrition_Percentage
FROM HR_EmployeeData
GROUP BY Department
ORDER BY Attrition_Count DESC;

3. Attrition by Salary Band

Groups employees into salary bands and shows attrition per band:

SELECT 
    CASE 
        WHEN MonthlyIncome < 3000 THEN 'Low'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN 'Medium'
        ELSE 'High'
    END AS Salary_Band,
    Attrition,
    COUNT(*) AS Count
FROM HR_EmployeeData
GROUP BY 
    CASE 
        WHEN MonthlyIncome < 3000 THEN 'Low'
        WHEN MonthlyIncome BETWEEN 3000 AND 6000 THEN 'Medium'
        ELSE 'High'
    END,
    Attrition
ORDER BY Salary_Band;

4. Attrition by Age Group

Analyzes attrition based on age ranges:

SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        ELSE '40+' 
    END AS Age_Group,
    Attrition,
    COUNT(*) AS Count
FROM HR_EmployeeData
GROUP BY 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        ELSE '40+' 
    END,
    Attrition
ORDER BY Age_Group;

5. Job Role vs Attrition

Displays attrition count for each job role:

SELECT 
    JobRole, 
    Attrition, 
    COUNT(*) AS Count
FROM HR_EmployeeData
GROUP BY JobRole, Attrition
ORDER BY Count DESC;

