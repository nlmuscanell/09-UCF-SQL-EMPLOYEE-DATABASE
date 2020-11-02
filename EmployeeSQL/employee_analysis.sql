---------------------
--Employee Analysis--
---------------------

SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM departments;

---------------------------------------------------------------------------------------------------------
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
---------------------------------------------------------------------------------------------------------

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM salaries as s
INNER JOIN employees AS e 
ON e.emp_no=s.emp_no
ORDER BY emp_no;

------------------------------------------------------------------------------------
--2. List first name, last name, and hire date for employees who were hired in 1986.
------------------------------------------------------------------------------------

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01' order by hire_date

---------------------------------------------------------------------------------------------------------------------------------------------
--3. List the manager of each dept. with the following information: dept number, dept name, manager's employee number, last name, first name.
---------------------------------------------------------------------------------------------------------------------------------------------

SELECT dept_manager.emp_no,
dept_manager.dept_no, 
departments.dept_name,
employees.last_name,
employees.first_name
FROM dept_manager
INNER JOIN departments 
ON dept_manager.dept_no=departments.dept_no
INNER JOIN employees
ON dept_manager.emp_no=employees.emp_no
ORDER BY emp_no;

--------------------------------------------------------------------------------------------------------------------------------------
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
--------------------------------------------------------------------------------------------------------------------------------------

SELECT dept_emp.emp_no, 
employees.last_name,
employees.first_name,
departments.dept_name
FROM dept_emp
INNER JOIN employees
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no=dept_emp.dept_no
ORDER BY emp_no;

--------------------------------------------------------------------------------------------------------------------
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
--------------------------------------------------------------------------------------------------------------------

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%' ORDER BY last_name;

-----------------------------------------------------------------------------------------------------------------------------
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-----------------------------------------------------------------------------------------------------------------------------

--Using join method
SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
departments.dept_name
FROM dept_emp
INNER JOIN employees
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no=dept_emp.dept_no
WHERE dept_name = 'Sales'
ORDER BY emp_no;

--Using subqueries
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
	(SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	 	(SELECT dept_no
		FROM departments
		WHERE dept_name IN
		 	(SELECT dept_name
			FROM departments
			WHERE dept_name = 'Sales'))) ORDER BY emp_no;

---------------------------------------------------------------------------------------------------------------------------------------------
--7. List all employees in the Sales and Development depts, including their employee number, last name, first name, and dept name.
----------------------------------------------------------------------------------------------------------------------------------------------

--Using join method
SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
departments.dept_name
FROM dept_emp
INNER JOIN employees
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no=dept_emp.dept_no
WHERE dept_name = 'Sales' or dept_name = 'Development'
ORDER BY dept_name, emp_no;

--Using subqueries
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
	(SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	 	(SELECT dept_no
		FROM departments
		WHERE dept_name IN
		 	(SELECT dept_name
			FROM departments
			WHERE dept_name = 'Sales' or dept_name = 'Development'))) ORDER BY dept_name, emp_no;

-------------------------------------------------------------------------------------------------------------------------
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-------------------------------------------------------------------------------------------------------------------------

SELECT last_name, COUNT(last_name) AS "Counts"
FROM employees
GROUP BY last_name ORDER BY last_name DESC;

---------------------------
--End of Employee Analysis
---------------------------
