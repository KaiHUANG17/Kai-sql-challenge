-- List the employee number, last name, first name, sex, and salary of each employee
SELECT 
	   e.emp_no, 
	   e.last_name,
	   e.first_name,
	   e.sex,
	   (
		   SELECT salary FROM "Salaries" AS s
		   WHERE e.emp_no = s.emp_no
	   ) AS salary
FROM "Employess" AS e;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT 
	   e.last_name,
	   e.first_name,
	   e.hire_date
	   
FROM "Employess" AS e

WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT 
	   dm.dept_no AS department_number,
	   d.dept_name AS department_name,
	   dm.emp_no AS employee_number,
	   e.last_name,
	   e.first_name
FROM "Dept_manager" AS dm

JOIN "Departments" AS d ON dm.dept_no = d.dept_no
JOIN "Employess" AS e ON dm.emp_no = e.emp_no ;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT 
	   de.dept_no AS department_number,
	   d.dept_name AS department_name,
	   de.emp_no AS employee_number,
	   e.last_name,
	   e.first_name
FROM "Dept_emp" AS de

JOIN "Departments" AS d ON de.dept_no = d.dept_no
JOIN "Employess" AS e ON de.emp_no = e.emp_no ;

-- List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT
	  first_name,
	  last_name,
	  sex
FROM "Employess"

WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT 
	   e.emp_no AS employee_number,
	   e.last_name,
	   e.first_name
FROM "Employess" AS e

JOIN "Dept_emp" AS de ON e.emp_no = de.emp_no
JOIN "Departments" AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT 
	   e.emp_no AS employee_number,
	   e.last_name,
	   e.first_name,
	   d.dept_name
FROM "Employess" AS e

JOIN "Dept_emp" AS de ON e.emp_no = de.emp_no
JOIN "Departments" AS d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT 
	  e.last_name,
	  COUNT(e.last_name) AS frequency
FROM "Employess" AS e
GROUP BY e.last_name
ORDER BY frequency DESC ;