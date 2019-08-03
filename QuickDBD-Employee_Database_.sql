-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/PdKACR
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "DepartmentNumber" varchar(25)   NOT NULL,
    "DepartmentName" varchar(45)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DepartmentNumber"
     )
);

CREATE TABLE "DepartmentEmployees" (
    "EmployeeNumber" int   NOT NULL,
    "DepartmentNumber" varchar(25)   NOT NULL,
    "FromDate" varchar(25)   NOT NULL,
    "ToDate" varchar(25)   NOT NULL
);

CREATE TABLE "DepartmentManagers" (
    "DepartmentNumber" varchar(25)   NOT NULL,
    "EmployeeNumber" int   NOT NULL,
    "FromDate" varchar(25)   NOT NULL,
    "ToDate" varchar(25)   NOT NULL
);

CREATE TABLE "Employees" (
    "EmployeeNumber" int   NOT NULL,
    "BirthDate" varchar(25)   NOT NULL,
    "FirstName" varchar(45)   NOT NULL,
    "LastName" varchar(45)   NOT NULL,
    "Gender" varchar(5)   NOT NULL,
    "HireDate" varchar(25)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "EmployeeNumber"
     )
);

CREATE TABLE "Salaries" (
    "EmployeeNumber" int   NOT NULL,
    "Salary" int   NOT NULL,
    "FromDate" varchar(25)   NOT NULL,
    "ToDate" varchar(25)   NOT NULL
);

CREATE TABLE "Titles" (
    "EmployeeNumber" int   NOT NULL,
    "Title" varchar(25)   NOT NULL,
    "FromDate" varchar(25)   NOT NULL,
    "ToDate" varchar(25)   NOT NULL
);

ALTER TABLE "DepartmentEmployees" ADD CONSTRAINT "fk_DepartmentEmployees_EmployeeNumber" FOREIGN KEY("EmployeeNumber")
REFERENCES "Employees" ("EmployeeNumber");

ALTER TABLE "DepartmentEmployees" ADD CONSTRAINT "fk_DepartmentEmployees_DepartmentNumber" FOREIGN KEY("DepartmentNumber")
REFERENCES "Departments" ("DepartmentNumber");

ALTER TABLE "DepartmentManagers" ADD CONSTRAINT "fk_DepartmentManagers_DepartmentNumber" FOREIGN KEY("DepartmentNumber")
REFERENCES "Departments" ("DepartmentNumber");

ALTER TABLE "DepartmentManagers" ADD CONSTRAINT "fk_DepartmentManagers_EmployeeNumber" FOREIGN KEY("EmployeeNumber")
REFERENCES "Employees" ("EmployeeNumber");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_EmployeeNumber" FOREIGN KEY("EmployeeNumber")
REFERENCES "Employees" ("EmployeeNumber");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_EmployeeNumber" FOREIGN KEY("EmployeeNumber")
REFERENCES "Employees" ("EmployeeNumber");

