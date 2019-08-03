--List of the following details of each employee: employee number, last name, first name, gender, and salary.

select 
"Employees"."EmployeeNumber",
"Employees"."LastName",
"Employees"."FirstName",
"Employees"."Gender",
"Salaries"."Salary"
from "Employees" 
join "Salaries" on "Employees"."EmployeeNumber" = "Salaries"."EmployeeNumber"



--List of employees who were hired in 1986.

select 
"Employees"."EmployeeNumber",
"Employees"."LastName",
"Employees"."FirstName",
"Employees"."HireDate"
from "Employees" 
where "HireDate"
like '%1986'



--List of the managers in each department with the following information: department number, department name,
--the manager's employee number, last name, first name, and start and end employment dates.

select 
"DepartmentManagers"."DepartmentNumber",
"Departments"."DepartmentName",
"DepartmentManagers"."EmployeeNumber",
"Employees"."LastName",
"Employees"."FirstName",
"DepartmentManagers"."FromDate",
"DepartmentManagers"."ToDate"
from "Departments" 
join "DepartmentManagers" on "Departments"."DepartmentNumber" = "DepartmentManagers"."DepartmentNumber"
join "Employees" on "DepartmentManagers"."EmployeeNumber" = "Employees"."EmployeeNumber"



--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select
"Employees"."EmployeeNumber",
"Employees"."LastName",
"Employees"."FirstName",
"Departments"."DepartmentName"
from "Employees"
join "DepartmentManagers" on "Employees"."EmployeeNumber" = "DepartmentManagers"."EmployeeNumber"
join "Departments" on "DepartmentManagers"."DepartmentNumber" = "Departments"."DepartmentNumber"



--List of all employees whose first name is "Hercules" and last names begin with "B

select 
"Employees"."EmployeeNumber",
"Employees"."LastName",
"Employees"."FirstName"
from "Employees"
where "LastName"
like 'B%' and "FirstName" = 'Hercules'



--List of all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

select 
"DepartmentEmployees"."EmployeeNumber",
"Employees"."LastName",
"Employees"."FirstName",
"Departments"."DepartmentName"
from "Departments"
join "DepartmentEmployees" on "Departments"."DepartmentNumber" = "DepartmentEmployees"."DepartmentNumber"
join "Employees" on "DepartmentEmployees"."EmployeeNumber" = "Employees"."EmployeeNumber"
where "DepartmentName" = 'Sales'



--List of all employees in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.

select 
"DepartmentEmployees"."EmployeeNumber",
"Employees"."LastName",
"Employees"."FirstName",
"Departments"."DepartmentName"
from "Departments"
join "DepartmentEmployees" on "Departments"."DepartmentNumber" = "DepartmentEmployees"."DepartmentNumber"
join "Employees" on "DepartmentEmployees"."EmployeeNumber" = "Employees"."EmployeeNumber"
where "DepartmentName" = 'Sales' or "DepartmentName" = 'Development'



--In descending order, a list the frequency count of employee
--last names, i.e., how many employees share each last name.

select
"Employees"."LastName", count("LastName") as LastNameCounts
from
"Employees"
group by "LastName"
order by LastNameCounts desc;