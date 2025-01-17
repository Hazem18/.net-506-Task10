--Create DataBase
CREATE DATABASE BarwonHealth

--Creating Tables + Constraints
CREATE TABLE DOCTOR
(
 ID INT PRIMARY KEY IDENTITY,
 [NAME] VARCHAR(50) NOT NULL,
 SPECIALTY VARCHAR(20) NOT NULL,
 EMAIL VARCHAR(50) NOT NULL,
 PHONE VARCHAR(50) NOT NULL,
 YEARS_OF_EXP INT NOT NULL
)
CREATE TABLE PATIENT
(
 UR_NUMBER INT PRIMARY KEY IDENTITY,
 [NAME] VARCHAR(50) NOT NULL,
 [ADDRESS] VARCHAR(50) NOT NULL,
 EMAIL VARCHAR(50) NOT NULL,
 PHONE VARCHAR(50) NOT NULL,
 AGE INT NOT NULL,
 MEDICARE_CARD_NUMBE VARCHAR(50),
 DOCTOR_ID INT FOREIGN KEY REFERENCES DOCTOR(ID)
)

CREATE TABLE COMPANY
(
ID INT PRIMARY KEY IDENTITY,
[NAME] VARCHAR(50) NOT NULL,
[ADDRESS] VARCHAR(50) NOT NULL,
PHONE VARCHAR(50) NOT NULL
)

CREATE TABLE DRUG
(
 ID INT PRIMARY KEY IDENTITY,
 TRADE_NAME VARCHAR(50) NOT NULL,
 STRENGTH VARCHAR(100) NOT NULL,
 COMPANY_ID INT FOREIGN KEY REFERENCES COMPANY(ID) ON DELETE CASCADE
)

CREATE TABLE PRESCRIPTION
(
  ID INT PRIMARY KEY IDENTITY,
  [DATE] DATETIME NOT NULL,
  QUANTITY INT NOT NULL,
  UR_NUMBER INT FOREIGN KEY REFERENCES PATIENT(UR_NUMBER),
  DOCTOR_ID INT FOREIGN KEY REFERENCES DOCTOR(ID),
  DRUG_ID INT FOREIGN KEY REFERENCES DRUG (ID)
)





