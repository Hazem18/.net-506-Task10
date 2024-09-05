--•	SELECT: Retrieve all columns from the Doctor table.
SELECT *
FROM DOCTOR 


--•	OFFSET FETCH: Retrieve the first 10 patients from the Patient table, starting from the 5th record.
SELECT *
FROM PATIENT
ORDER BY UR_NUMBER
OFFSET 4 ROWS 
FETCH NEXT 10 ROWS ONLY


--•	SELECT TOP: Retrieve the top 5 doctors from the Doctor table.
SELECT TOP 5 *
FROM DOCTOR


--•	SELECT DISTINCT: Get a list of unique address from the Patient table.
SELECT DISTINCT [ADDRESS]
FROM PATIENT


--•	WHERE: Retrieve patients from the Patient table who are aged 25.
SELECT *
FROM PATIENT
WHERE AGE = 25


--•	NULL: Retrieve patients from the Patient table whose email is not provided.
SELECT *
FROM PATIENT
WHERE EMAIL IS NULL


--•	AND: Retrieve doctors from the Doctor table who have experience greater than 5 years and specialize in 'Cardiology'.
SELECT *
FROM DOCTOR
WHERE YEARS_OF_EXP > 5 AND SPECIALTY = 'Cardiology'


--•	IN: Retrieve doctors from the Doctor table whose speciality is either 'Dermatology' or 'Oncology'.
SELECT *
FROM DOCTOR
WHERE SPECIALTY IN ('Dermatology' , 'Oncology')


--•	BETWEEN: Retrieve patients from the Patient table whose ages are between 18 and 30.
SELECT *
FROM PATIENT
WHERE AGE BETWEEN 18 AND 30


--•	LIKE: Retrieve doctors from the Doctor table whose names start with 'Dr.'.
SELECT *
FROM DOCTOR
WHERE [NAME] LIKE 'Dr.%'


--•	Column & Table Aliases: Select the name and email of doctors, aliasing them as 'DoctorName' and 'DoctorEmail'.
SELECT [NAME] DoctorName , EMAIL DoctorEmail
FROM DOCTOR


--•	Joins: Retrieve all prescriptions with corresponding patient names.
SELECT PR.* , PA.[NAME] PatientName
FROM PRESCRIPTION PR
JOIN PATIENT PA
ON PA.UR_NUMBER = PR.UR_NUMBER


--•	GROUP BY: Retrieve the count of patients grouped by their cities.
SELECT [ADDRESS] , COUNT(*) 'NUMBER OF PATIENTS'
FROM PATIENT
GROUP BY [ADDRESS]


--•	HAVING: Retrieve cities with more than 3 patients.
SELECT [ADDRESS]
FROM PATIENT
GROUP BY [ADDRESS]
HAVING COUNT(*) > 3
--•	UNION: Retrieve a combined list of doctors and patients. (Search)
SELECT [NAME]  , PHONE  
FROM DOCTOR
UNION
SELECT [NAME] , PHONE  
FROM PATIENT
--•	Common Table Expression (CTE): Retrieve patients along with their doctors using a CTE.
WITH CTE_P_D AS
(
SELECT P.NAME 'PATIENT NAME', D.[NAME] AS 'DOCTOR NAME' ,D.SPECIALTY
FROM PATIENT P JOIN DOCTOR D
ON D.ID = P.DOCTOR_ID
)
SELECT * FROM CTE_P_D
--•	INSERT: Insert a new doctor into the Doctor table.
INSERT INTO DOCTOR VALUES ('HAZEM EMAD' , 'HEALTH' , 'HAZEM@GMAIL.COM','01128726058',3)


--•	INSERT Multiple Rows: Insert multiple patients into the Patient table.
INSERT INTO PATIENT VALUES ('OMAR ALI' , 'GIZA' , 'OMAR@GMAIL.COM' , '011223', '19' , '990-66778UIO' , 2) , ('ADEL ALI' , 'GIZA' , 'ADEL@GMAIL.COM' , '0117786', '22' , '990-90OKI' , 16)


--•	UPDATE: Update the phone number of a doctor.
UPDATE DOCTOR
SET PHONE = 011822524
WHERE ID = 7


--•	UPDATE JOIN: Update the city of patients who have a prescription from a specific doctor.
UPDATE PATIENT
SET [ADDRESS] = 'ALEXANDRIA'
FROM PATIENT PA JOIN PRESCRIPTION PR
ON PR.UR_NUMBER = PA.UR_NUMBER
WHERE PR.DOCTOR_ID = 3


--•	DELETE: Delete a patient from the Patient table.
DELETE FROM PATIENT
WHERE [NAME] = 'Ted Van Zon'


--•	Transaction: Insert a new doctor and a patient, ensuring both operations succeed or fail together.
BEGIN TRANSACTION
INSERT INTO DOCTOR VALUES ('MOHAMED ALAA' , 'HEALTH' , 'MEDO@GMAIL.COM','987687',5)
INSERT INTO PATIENT VALUES ('ZAKI' , 'CAIRO' , 'ZAKI@GMAIL.COM' , '098875', '22' , '990-8UYUY6' , 7)
COMMIT;


--•	View: Create a view that combines patient and doctor information for easy access.
CREATE VIEW VIEW_P_D
AS
SELECT P.NAME 'PATIENT NAME', D.[NAME] AS 'DOCTOR NAME' ,D.SPECIALTY
FROM PATIENT P JOIN DOCTOR D
ON D.ID = P.DOCTOR_ID

SELECT * FROM VIEW_P_D


--•	Index: Create an index on the 'phone' column of the Patient table to improve search performance.
CREATE NONCLUSTERED INDEX PHONE_INDEX
ON PATIENT(PHONE)


--•	Backup: Perform a backup of the entire database to ensure data safety
BACKUP LOG BARWONHEALTH
TO  DISK = N'D:\backup\BARWONHEALTH.bak' 
