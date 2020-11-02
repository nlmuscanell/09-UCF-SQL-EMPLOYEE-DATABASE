------------------------------------------------------------------------ 
--Drop Tables if existing
------------------------------------------------------------------------ 
DROP TABLE departments CASCADE;
DROP TABLE employees CASCADE;
DROP TABLE dept_emp CASCADE;
DROP TABLE dept_manager CASCADE;
DROP TABLE salaries CASCADE;
DROP TABLE titles CASCADE;
------------------------------------------------------------------------ 
--Create Tables
------------------------------------------------------------------------ 
CREATE TABLE employees
(emp_no INT NOT NULL,
 emp_title_id VARCHAR(10),
 birth_date DATE,
 first_name VARCHAR(20),
 last_name VARCHAR(20),
 sex VARCHAR(1),
 hire_date DATE,
 PRIMARY KEY (emp_no));
 
 CREATE TABLE salaries
(emp_no INT NOT NULL,
 salary INT,
 PRIMARY KEY (emp_no));

 --The dept_emp table has only two columns with redundant identifiers (adding composite key)
 CREATE TABLE dept_emp
(emp_no INT NOT NULL,
 dept_no VARCHAR(10),
 PRIMARY KEY (emp_no, dept_no));
 
 CREATE TABLE dept_manager
(dept_no VARCHAR(10),
 emp_no INT NOT NULL,
 PRIMARY KEY (emp_no));
 
 CREATE TABLE departments
(dept_no VARCHAR(10) NOT NULL,
 dept_name VARCHAR(20),
 PRIMARY KEY (dept_no));
 
 CREATE TABLE titles
(title_id VARCHAR(10) NOT NULL,
 title VARCHAR(20),
 PRIMARY KEY (title_id));
 
------------------------------------------------------------------------ 
--IMPORT DATA INTO TABLES
------------------------------------------------------------------------ 

------------------------------------------------------------------------ 
--Add Foreign Keys
------------------------------------------------------------------------ 
ALTER TABLE salaries
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);
 
ALTER TABLE dept_emp
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);
 
ALTER TABLE dept_manager
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

ALTER TABLE employees
ADD FOREIGN KEY(emp_title_id) REFERENCES titles(title_id); 

ALTER TABLE dept_manager
ADD FOREIGN KEY (dept_no) REFERENCES departments (dept_no);

ALTER TABLE dept_emp
ADD FOREIGN KEY (dept_no) REFERENCES departments (dept_no);
