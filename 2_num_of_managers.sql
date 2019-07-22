SELECT
	td.dept_name,
    te.gender,
    tdm.emp_no,
    tdm.from_date,
    tdm.to_date,
    e.calendar_year,
    CASE
		WHEN e.calendar_year >= YEAR(tdm.from_date) AND e.calendar_year <= YEAR(tdm.to_date) THEN 1
        ELSE 0
    END AS active
FROM
	(SELECT
		YEAR(hire_date) AS calendar_year
	FROM
		t_employees 
	GROUP BY calendar_year) e
		CROSS JOIN
    t_dept_manager tdm
		JOIN
    t_departments td ON td.dept_no = tdm.dept_no
		JOIN
    t_employees te ON te.emp_no = tdm.emp_no
ORDER BY tdm.emp_no, e.calendar_year;

