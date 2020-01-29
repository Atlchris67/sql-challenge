--List the following details of each employee: employee number, last name, first name, gender, and salary.-------
select  e.emp_no, last_name, first_name, gender, salary 
	from employees as e join salaries as s
	on e.emp_no = s.emp_no

	
--List employees who were hired in 1986.
select * from employees where hire_date >  Convert(datetime, '1985-12-31' )

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT        departments.dept_no, departments.dept_name, employees.emp_no, employees.first_name, employees.last_name, employees.hire_date, dept_manager.to_date
FROM            departments INNER JOIN
                         dept_manager ON departments.dept_no = dept_manager.dept_no INNER JOIN
                         employees ON dept_manager.emp_no = employees.emp_no
where to_date = '9999-01-01'
order by  dept_no desc


--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT        employees.emp_no, employees.last_name, employees.first_name, departments.dept_name,dept_name
FROM            departments INNER JOIN
                         dept_emp ON departments.dept_no = dept_emp.dept_no INNER JOIN
                         employees ON dept_emp.emp_no = employees.emp_no
						 where to_date = '9999-01-01'

--List all employees whose first name is "Hercules" and last names begin with "B."
-- COLLATE Latin1_General_CS_AS forces case 
select * from employees
where first_name = 'Hercules' and LEFT(last_name, 1) COLLATE Latin1_General_CS_AS = 'B'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT        employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM            departments INNER JOIN
                         dept_emp ON departments.dept_no = dept_emp.dept_no INNER JOIN
                         employees ON dept_emp.emp_no = employees.emp_no
						 where dept_name = 'sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT        employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM            departments INNER JOIN
                         dept_emp ON departments.dept_no = dept_emp.dept_no INNER JOIN
                         employees ON dept_emp.emp_no = employees.emp_no
						 where dept_name in ('sales', 'Development') 

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*) from employees
group by last_name
order by count(*) desc 