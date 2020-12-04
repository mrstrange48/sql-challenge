-- Question 1 List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT
   employees.emp_no,
   employees.last_name,
   employees.first_name,
   employees.sex,
   salaries.salary
FROM
   public.employees
INNER JOIN salaries
	on salaries.emp_no = employees.emp_no;

-- Question 2 List first name, last name, and hire date for employees who were hired in 1986.
SELECT
   first_name,
   last_name,
   hire_date
FROM
   public.employees
   where date_part('year',hire_date) = 1986;

-- Question 3 List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
   de.dept_no,
   de.dept_name,
   e.emp_no,
   e.last_name,
   e.first_name
FROM
	public.dept_manager as d
INNER JOIN employees as e
	on e.emp_no = d.emp_no
Inner Join departments as de
	on de.dept_no = d.dept_no;

-- Question 4 List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
   e.emp_no,
   e.last_name,
   e.first_name,
   de.dept_name
FROM
	public.dept_emp as d
INNER JOIN employees as e
	on e.emp_no = d.emp_no
Inner Join departments as de
	on de.dept_no = d.dept_no;

-- Question 5 List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT
   first_name,
   last_name,
   sex
FROM
   public.employees
   where first_name = 'Hercules' and last_name like 'B%';
-- Question 6 List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
  e.emp_no,
  e.last_name,
  e.first_name,
  de.dept_name
FROM
   public.employees as e
Inner Join dept_emp as d
	on e.emp_no = d.emp_no
Inner Join departments as de
	on de.dept_no = d.dept_no
   where de.dept_name = 'Sales';

-- Question 7 List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
  e.emp_no,
  e.last_name,
  e.first_name,
  de.dept_name
FROM
   public.employees as e
Inner Join dept_emp as d
	on e.emp_no = d.emp_no
Inner Join departments as de
	on de.dept_no = d.dept_no
   where de.dept_name = 'Sales'
   or dept_name = 'Development';

-- Queston 8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
	COUNT(last_name) AS "frequency"
FROM employees
	GROUP BY last_name
	ORDER BY
	COUNT(last_name) DESC;