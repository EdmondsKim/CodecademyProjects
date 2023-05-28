--CODECADEMY Employee Projects 
--Looking at both databases
SELECT *
FROM employees;
SELECT *
FROM projects;

--Which employees have not picked a project yet?
SELECT first_name || ' ' || last_name AS EmployeeName, current_project
FROM employees
WHERE current_project IS  NULL;

--Which projects haven't been selected yet?
SELECT *
FROM projects
LEFT JOIN employees
ON projects.project_id = employees.current_project
WHERE employees.current_project IS NULL;

--Which project is the most popular one chosen?
SELECT projects.project_name, COUNT(employees.current_project)
FROM projects
LEFT JOIN employees
ON projects.project_id = employees.current_project
WHERE employees.current_project IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;
 
--Which personality type is the most common among the employees?
SELECT personality, COUNT(personality)
FROM employees
GROUP BY personality
ORDER BY 2 DESC;

--Which projects were selected by employees with the same personality type?

SELECT projects.project_name, COUNT(employees.personality) AS UniquePersonalities
FROM projects
LEFT JOIN employees
ON projects.project_id = employees.current_project
WHERE employees.current_project IS NOT NULL
GROUP BY 1
ORDER BY UniquePersonalities ASC;
