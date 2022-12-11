-- Module 9 Challenge Queries --------

-- Query 1: List the employee number, last name, first name, 
-- sex, and salary of each employee (2 points)

SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

--Query 2: List the first name, last name, and hire date 
--for the employees who were hired in 1986 (2 points)

SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE e.hire_date LIKE '%1986';

--Query 3: List the manager of each department along with 
--their department number, department name, employee number, 
--last name, and first name (2 points)

SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, d.dept_name
FROM employees e
INNER JOIN dept_manager dm ON (e.emp_no = dm.emp_no)
INNER JOIN departments d ON (dm.dept_no = d.dept_no)
ORDER BY e.emp_no ASC;

--Query 4: List the department number for each employee along with 
--that employee’s employee number, last name, first name, and department name (2 points)

SELECT e.emp_no, e.first_name, e.last_name, de.dept_no, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON (e.emp_no = de.emp_no)
INNER JOIN departments d ON (de.dept_no = d.dept_no);

--Query 5: List first name, last name, and sex of each employee whose first name 
--is Hercules and whose last name begins with the letter B (2 points)

SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

--Query 6: List each employee in the Sales department, including their employee number, 
--last name, and first name (2 points)

SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
INNER JOIN dept_emp de ON (e.emp_no = de.emp_no)
INNER JOIN departments d ON (de.dept_no = d.dept_no)
WHERE d.dept_no = 'd007';

--Query 7: List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name (4 points)

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON (e.emp_no = de.emp_no)
INNER JOIN departments d ON (de.dept_no = d.dept_no)
WHERE d.dept_no = 'd007' OR d.dept_no = 'd005';

--Query 8: List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name) (4 points)

SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC