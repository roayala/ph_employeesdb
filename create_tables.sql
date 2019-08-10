SELECT * FROM departments;
SELECT * FROM dept_emp LIMIT 3;
SELECT * FROM dept_manager LIMIT 2;
SELECT * FROM employees LIMIT 2;
SELECT * FROM salaries LIMIT 2;
SELECT * FROM titles LIMIT 2;


DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

-- Create a departments, employees, dept_manager, dept_emp, salaries and titles tables

CREATE TABLE departments (
    dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(100)  NOT NULL );

CREATE TABLE dept_manager (
    dept_no VARCHAR(30) NOT NULL,
    emp_no INTEGER NOT NULL,
    from_date DATE  NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) 
	REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no)
	REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
    emp_no INTEGER  NOT NULL,
    dept_no VARCHAR(30) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
    );


CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY NOT NULL,
    birth_date DATE  NOT NULL,
    first_name VARCHAR(50)  NOT NULL,
    last_name VARCHAR(50)  NOT NULL,
    gender VARCHAR(10)  NOT NULL,
    hire_date DATE NOT NULL);
	
CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
    );

CREATE TABLE titles (
    emp_no int  NOT NULL ,
    title VARCHAR  NOT NULL ,
    from_date date NOT NULL ,
    to_date date NOT NULL ,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
    );