-- Once you have a complete database, do the following:
-- List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT a.emp_no AS employee_number, last_name, first_name, gender, salary
FROM employees AS a
JOIN salaries AS b ON a.emp_no = b.emp_no
ORDER BY employee_number;

-- List employees who were hired in 1986.

SELECT * FROM employees;

SELECT emp_no AS employee_number, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986'
ORDER BY hire_date;

-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.

SELECT * FROM dept_manager;
SELECT * FROM departments;

SELECT em.emp_no AS employee_no, last_name, first_name, dept_name, ma.dept_no
FROM employees AS em
JOIN dept_manager AS ma ON ma.emp_no = em.emp_no
JOIN departments  AS dep ON dep.dept_no = ma.dept_no
ORDER BY employee_no;

-- List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.

SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM departments;

SELECT em.emp_no AS employee_no, last_name, first_name, dept_name
FROM employees AS em
JOIN dept_emp AS dem ON dem.emp_no = em.emp_no
JOIN departments AS dept ON dept.dept_no = dem.dept_no
ORDER BY employee_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.

SELECT em.emp_no AS employee_no, last_name, first_name, dept_name
FROM employees AS em
JOIN dept_emp AS dem ON dem.emp_no = em.emp_no
JOIN departments AS dept ON dept.dept_no = dem.dept_no
WHERE dept_name = 'Sales'
ORDER BY employee_no;

-- List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.

SELECT em.emp_no AS employee_no, last_name, first_name, dept_name
FROM employees AS em
JOIN dept_emp AS dem ON dem.emp_no = em.emp_no
JOIN departments AS dept ON dept.dept_no = dem.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY employee_no;

-- In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY last_name;





