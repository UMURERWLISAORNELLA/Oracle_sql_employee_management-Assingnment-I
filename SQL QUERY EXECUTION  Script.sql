SQL QUERY EXECUTION  Script

This example I used in executing the query I got it from the internet while trying to learn more about the syntax of query

1. Codes for creating tables
-- Create Departments Table
CREATE TABLE Departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(100)
);

-- Create Employees Table with a foreign key relationship to Departments
CREATE TABLE Employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    hire_date DATE,
    department_id NUMBER,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Create Projects Table
CREATE TABLE Projects (
    project_id NUMBER PRIMARY KEY,
    project_name VARCHAR2(100),
    start_date DATE,
    end_date DATE
);

-- Create Salaries Table with foreign key to Employees
CREATE TABLE Salaries (
    salary_id NUMBER PRIMARY KEY,
    employee_id NUMBER,
    salary_amount NUMBER,
    pay_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);


2. inserting data
-- Insert into Departments
INSERT INTO Departments (department_id, department_name)
VALUES (1, 'HR');

INSERT INTO Departments (department_id, department_name)
VALUES (2, 'Finance');

INSERT INTO Departments (department_id, department_name)
VALUES (3, 'Accounting');

-- Insert into Employees
-- Insert the first employee
INSERT INTO Employees (employee_id, first_name, last_name, hire_date, department_id)
VALUES (101, 'John', 'Doe', TO_DATE('2021-01-15', 'YYYY-MM-DD'), 1);

-- Insert the second employee
INSERT INTO Employees (employee_id, first_name, last_name, hire_date, department_id)
VALUES (102, 'Jane', 'Smith', TO_DATE('2020-03-22', 'YYYY-MM-DD'), 3);

-- Insert into Projects
INSERT INTO Projects (project_id, project_name, start_date, end_date)
VALUES (201, 'Database Migration', TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD'));

-- Insert into Salaries

-- Insert the first salary
INSERT INTO Salaries (salary_id, employee_id, salary_amount, pay_date)
VALUES (301, 101, 5000, TO_DATE('2023-09-01', 'YYYY-MM-DD'));

-- Insert the second salary
INSERT INTO Salaries (salary_id, employee_id, salary_amount, pay_date)
VALUES (302, 102, 7000, TO_DATE('2023-09-01', 'YYYY-MM-DD'));

3.update and delete 
-- Update an employee's salary
UPDATE Salaries
SET salary_amount = 5500
WHERE employee_id = 101;

-- Delete a project
DELETE FROM Projects
WHERE project_id = 201;


4. perform joins 

a.	Inner join

-- Join Employees with Departments to get employee names and their departments
SELECT e.first_name, e.last_name, d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

b.	Left join

-- Retrieve all employees, including those who may not be assigned to a department

SELECT e.first_name, e.last_name, d.department_name
FROM Employees e
LEFT JOIN Departments d
ON e.department_id = d.department_id;

c.	Right join
-- Retrieve all departments, including those that have no employees assigned
SELECT e.first_name, e.last_name, d.department_name
FROM Employees e
RIGHT JOIN Departments d
ON e.department_id = d.department_id;

d.	Full outer join

-- Retrieve all employees and all departments, showing NULL where there is no match
SELECT e.first_name, e.last_name, d.department_name
FROM Employees e
FULL OUTER JOIN Departments d
ON e.department_id = d.department_id;

e.	Join with multiple tables 

-- Join Employees, Departments, and Salaries to show employee details, salary, and department
SELECT e.first_name, e.last_name, d.department_name, s.salary_amount
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id
INNER JOIN Salaries s
ON e.employee_id = s.employee_id;
f.	Subquery with join
-- Get employees whose salary is above the average salary
SELECT e.first_name, e.last_name, s.salary_amount
FROM Employees e
INNER JOIN Salaries s
ON e.employee_id = s.employee_id
WHERE s.salary_amount > (SELECT AVG(salary_amount) FROM Salaries);

COMMIT;  -- Save changes
-- or
ROLLBACK;  -- Undo changes



CREATE USER emp_user IDENTIFIED BY emp123;



GRANT CONNECT TO emp_user;
GRANT SELECT ON Departments TO emp_user;
GRANT INSERT ON Employees TO emp_user;


REVOKE INSERT ON Employees FROM emp_user;

REFERENCES 
1.	Open ai
