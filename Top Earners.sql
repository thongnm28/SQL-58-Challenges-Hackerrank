SELECT salary*months AS earnings,
       COUNT(employee_id)
FROM employee 
WHERE salary*months = (select MAX(salary*months) FROM employee )
GROUP BY 1;