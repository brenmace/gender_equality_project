DROP PROCEDURE IF EXISTS filter_salary;

DELIMITER $$
CREATE PROCEDURE filter_salary(IN p_low_salary FLOAT, IN p_high_salary FLOAT)
BEGIN
SELECT
	te.gender,
    td.dept_name,
    ROUND(AVG(ts.salary),2) AS avg_salary
FROM
	t_salaries ts
		JOIN
	t_employees te ON te.emp_no = ts.emp_no
		JOIN
	t_dept_emp tde ON te.emp_no = tde.emp_no
		JOIN
	t_departments td ON tde.dept_no = td.dept_no
	WHERE ts.salary BETWEEN p_low_salary AND p_high_salary
GROUP BY td.dept_no, te.gender
ORDER BY td.dept_no, te.gender;
END$$

DELIMITER ;

CALL filter_salary(50000, 90000);