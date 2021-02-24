
SELECT count(id)
FROM stops;

SELECT id
FROM stops
WHERE name = 'Craiglockhart';

SELECT id, name
FROM stops JOIN route ON id = stop
WHERE num = '4' AND company = 'LRT';

SELECT company, num, COUNT(*) as stops
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING stops > 1

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115  AND b.stop=137
group by company, num

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross'



SELECT stops2.name, route2.company, route2.num 
FROM route AS route1
JOIN route AS route2 
ON route1.company = route2.company AND route1.num = route2.num
JOIN stops AS stops1 ON route1.stop = stops1.id
JOIN stops AS stops2 ON route2.stop = stops2.id
WHERE stops1.name = 'Craiglockhart'


-- Solution from most upvoted solution at:
-- https://stackoverflow.com/questions/24834948/self-join-tutorial-10-on-sqlzoo
-- & https://github.com/Tenacious-Qi Github Repo

SELECT DISTINCT 1st.num AS first_bus, 1st.company AS first_company, 
                stops.name AS transfer, 
                2nd.num AS second_bus, 2nd.company AS second_company
FROM
-- TABLE 1 - list of routes originating from 'Craiglockhart'
 (
    SELECT a.company, a.num, b.stop
    -- first self-join
    FROM route a JOIN route b ON a.company = b.company AND a.num = b.num
    WHERE a.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart')
) AS 1st
JOIN 
-- TABLE 1 - list of routes originating from 'Lochend'
(
    SELECT a.company, a.num, b.stop
    -- second self-join
    FROM route a JOIN route b ON a.company = b.company AND a.num = b.num
    WHERE a.stop = (SELECT id FROM stops WHERE name = 'Lochend')
) AS 2nd
-- join the above two tables on their matching stops
ON 1st.stop = 2nd.stop
JOIN stops ON stops.id = 1st.stop
ORDER BY first_bus, transfer, second_bus;
 