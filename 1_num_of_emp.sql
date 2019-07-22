SELECT 
    EXTRACT(YEAR FROM tde.from_date) AS calendar_year,
    te.gender,
    COUNT(te.emp_no) AS num_of_employees
FROM
    t_employees te
        JOIN
    t_dept_emp tde ON te.emp_no = tde.emp_no
GROUP BY calendar_year , te.gender
HAVING calendar_year >= '1990'
ORDER BY calendar_year;

