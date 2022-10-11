--Employees_Database_Challenge--Employees_Database_Challenge
-- Deliverable 1

-- Create a Retirement Titles table that holds all the titles of employees who were born between 
-- January 1, 1952 and December 31, 1955. Because some employees may have multiple titles in the
-- database—for example, due to promotions—you’ll need to use the DISTINCT ON statement to create
-- a table that contains the most recent title of each employee. Then, use the COUNT() function 
-- to create a table that has the number of retirement-age employees by most recent job title. 
-- Finally, because we want to include only current employees in our analysis, be sure to exclude
-- those employees who have already left the company.

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
-- INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

---- DELIVERABLE 2
SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no

SELECT * FROM mentorship_eligibility

SELECT d.dept_name,
	de.emp_no,
	de.to_date,
	e.first_name,
	e.last_name,
	e.birth_date
FROM departments AS d
INNER JOIN dept_emp AS de
ON (d.dept_no = de.dept_no)
INNER JOIN employees AS e
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-01-01')
AND (de.to_date = '9999-01-01')
ORDER BY (d.dept_name) DESC;

SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
	d.dept_name
INTO unique_titles_department
FROM retirement_titles as rt
INNER JOIN dept_emp as de
ON (rt.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
ORDER BY rt.emp_no, rt.to_date DESC;
DROP TABLE unique_titles_department CASCADE;


-- Determining the title of mentorship eligiblity
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
	d.dept_name
INTO retirement_titles_depts
FROM retirement_titles AS rt
INNER JOIN dept_emp AS de
ON (rt.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
ORDER BY rt.emp_no, rt.to_date DESC;


SELECT COUNT(rtd.title), 
	rtd.title,
	rtd.dept_name
FROM retirement_titles_depts AS rtd
GROUP BY rtd.dept_name, rtd.title
ORDER BY rtd.dept_name DESC;
	