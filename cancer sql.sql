use world;
SQL

-- 1. Find all female patients over the age of 60 from the province of 'Beijing'
SELECT * FROM Patients 
WHERE Gender = 'Female' AND Age > 60 AND Province = 'Beijing';

-- 2. What is the maximum age of patients with SurvivalStatus = 'Alive'?
SELECT MAX(Age) FROM Patients 
WHERE SurvivalStatus = 'Alive';

-- 3. Find the average Age of patients of each Gender
SELECT Gender, AVG(Age) FROM Patients 
GROUP BY Gender;

-- 4. Extract the year from DiagnosisDate and count diagnoses per year
SELECT YEAR(DiagnosisDate) AS DiagnosisYear, COUNT(*) 
FROM Patients 
GROUP BY YEAR(DiagnosisDate);

-- 5. What is the average TumorSize across all patients?
SELECT AVG(TumorSize) FROM Patients;

-- 6. Select patients whose Comorbidities contains the word 'dia'
SELECT * FROM Patients 
WHERE Comorbidities LIKE '%dia%';

-- 7. Retrieve all patients where TumorSize > 5 AND CancerStage is 'Stage III'
SELECT * FROM Patients 
WHERE TumorSize > 5 AND CancerStage = 'Stage III';

-- 8. Find CancerStage groups where the average TumorSize is greater than 4
SELECT CancerStage, AVG(TumorSize) 
FROM Patients 
GROUP BY CancerStage 
HAVING AVG(TumorSize) > 4;

-- 9. Find all patients from provinces starting with the letter 'S'
SELECT * FROM Patients 
WHERE Province LIKE 'S%';

-- 10. Find how many months passed between DiagnosisDate and SurgeryDate for each patient
SELECT PatientID, DATEDIFF(MONTH, DiagnosisDate, SurgeryDate) AS MonthsPassed 
FROM Patients;

-- 11. How many total ChemotherapySessions have been conducted?
SELECT SUM(ChemotherapySessions) FROM Patients;

-- 12. Select patients diagnosed after '2020-01-01'
SELECT * FROM Patients 
WHERE DiagnosisDate > '2020-01-01';

-- 13. List patients whose TumorSize is above the average tumor size
SELECT * FROM Patients 
WHERE TumorSize > (SELECT AVG(TumorSize) FROM Patients);

-- 14. Group by TumorType and return only those groups having more than 20 patients
SELECT TumorType, COUNT(*) 
FROM Patients 
GROUP BY TumorType 
HAVING COUNT(*) > 20;

-- 15. Add a new column BMI (FLOAT) to the table
ALTER TABLE Patients 
ADD BMI FLOAT;

-- 16. Get the average FollowUpMonths grouped by SurvivalStatus
SELECT SurvivalStatus, AVG(FollowUpMonths) 
FROM Patients 
GROUP BY SurvivalStatus;

-- 17. Show the top 10 oldest patients, ordered by Age descending
SELECT TOP 10 * FROM Patients 
ORDER BY Age DESC;

-- 18. Retrieve patients ordered by DiagnosisDate in ascending order
SELECT * FROM Patients 
ORDER BY DiagnosisDate ASC;

-- 19. Convert all values in Ethnicity column to uppercase and display them
SELECT UPPER(Ethnicity) FROM Patients;

-- 20. Delete all patients who were diagnosed before the year 2000
DELETE FROM Patients 
WHERE YEAR(DiagnosisDate) < 2000;

-- 21. Count how many patients belong to each CancerStage
SELECT CancerStage, COUNT(*) 
FROM Patients


