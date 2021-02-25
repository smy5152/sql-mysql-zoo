SELECT name
FROM teacher
WHERE dept IS NULL;

SELECT teacher.name, dept.name
FROM teacher JOIN dept
ON (teacher.dept = dept.id)

SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
ON (teacher.dept = dept.id)

SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
ON (teacher.dept = dept.id)

SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile
FROM teacher;

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher left JOIN dept
ON (teacher.dept = dept.id)

SELECT COUNT(name), COUNT(mobile)
FROM teacher;

SELECT dept.name, COUNT(teacher.name) AS teachers
FROM teacher RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;

SELECT name, 
CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' ELSE 'Art' END AS dept
FROM teacher;

SELECT name,
CASE WHEN dept = 1 OR dept = 2 THEN 'Sci'
     WHEN dept = 3             THEN 'Art'
     ELSE                           'None'
     END
FROM teacher;
