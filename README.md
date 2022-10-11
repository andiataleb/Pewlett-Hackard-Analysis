# Pewlett-Hackard-Analysis


## Overview

As a data analyst as Pewlett-Hackard company, my colleague and I were tasked to create a table that contains the number of employees for each title who are getting ready to retire in near future. These are the current employees whose birthdate is between 01/01/1952 and 12/31/1955. Some of the employees held different title during their employment with the company and we were asked to determine their most current title at the time of retirement which can be viewed in the following table.

[unique_titles.csv](https://github.com/andiataleb/Pewlett-Hackard-Analysis/files/9758073/unique_titles.csv)


Since there is a huge nuymber of emplyees getting ready to retire, to help the company prevent the effects of this "silver tsunami" there is a program being introduced that keep some of the retirees as a part time mentors in the company, so that they can help with training and mentoring the new hires. We were also tasked with identifying the employees who are eligible for this program. 

## Results

The results of the two analysis that we performed for this part of the project are as follow:

- There are 74,458 total number of employees who are ready and eligible to retire during the "silver tsunami". 

- Many of the employees who are ready to retire held different positions during their time of employment at the company.

- The largest portion (35.7%) of the retirees will be from the senior engineers followed by senio staff (34.4%). This will result in a large decrease among senior employees and the mentorship program can help widely to prevent the effects of losing senior team members who are experienced.

- The total number of future retirees who are eligible to participate in the mentorship program are 1549 which is only %2.1 of the retirees.

## Summary

How many roles will need to be filled as the "silver tsunami" begins to make an impact?

- There are 72,458 employees ready to retire with 1549 of them being eligible for the mentorship program. This will open the need for 70,909 roles to be filled during the "silver tsunami".

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

Among the total number the retirement-ready employees,only 2.1% of them eligible to participate in mentorship program. Increasing the number of the mentors will increase the efficiency of the trainings as well as reducing the number of the workforce loss.

In order to have a better insight to the upcoming tsunami of retirements my suggestion is to identify the departments with most employees who are retiring. Moreover, basing the mentorship eligiblity solely on the date of birth of the employees may not yield to the most practical group of mentors for next generation training as they may be from the titles that won't have many open positions. Therefore, my recomendation is to also take the title of the mentors in to consideration so that we can modify the criteria if it's needed.
Below you can see the queries to identify the department of each future retiree. 

`SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
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
ORDER BY rt.emp_no, rt.to_date DESC;`

*Determining the departments of retirees
*Determining the title of mentorship eligiblity
