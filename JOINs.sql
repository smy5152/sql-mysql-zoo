SELECT
    matchid,
    player
FROM
    goal
WHERE
    teamid = 'GER';

SELECT
    id,
    stadium,
    team1,
    team2
FROM
    game
WHERE
    id = '1012';

SELECT
    player,
    teamid,
    stadium,
    mdate
FROM
    game
    JOIN goal ON (id = matchid)
WHERE
    teamid = 'GER';

SELECT
    team1,
    team2,
    player
FROM
    game
    JOIN goal ON (id = matchid)
WHERE
    player LIKE 'MARIO %';

SELECT
    player,
    teamid,
    coach,
    gtime
FROM
    goal
    JOIN eteam ON teamid = id
WHERE
    gtime <= 10;

SELECT
    mdate,
    teamname
FROM
    game
    JOIN eteam ON game.team1 = eteam.id
WHERE
    coach = 'Fernando Santos';

SELECT
    player
FROM
    goal
    JOIN game ON goal.matchid = game.id
WHERE
    stadium = 'National Stadium, Warsaw';

SELECT
    DISTINCT player
FROM
    game
    JOIN goal ON matchid = id
WHERE 'GER' IN (team1, team2)
AND teamid != 'GER'

SELECT teamname, count(*)
  FROM eteam JOIN goal ON id=teamid
 group BY teamname

SELECT
    stadium,
    COUNT(*)
FROM
    game
    JOIN goal ON id = matchid
GROUP BY
    stadium;

SELECT
    matchid,
    mdate,
    COUNT(*)  as 'Goals'
FROM
    game
    JOIN goal ON matchid = id
WHERE
    (
        team1 = 'POL'
        OR team2 = 'POL'
    )
GROUP BY
    matchid,
    mdate;

SELECT
    matchid,
    mdate,
    COUNT(*)
FROM
    game
    JOIN goal ON matchid = id
WHERE
    (teamid = 'GER')
GROUP BY
    matchid,
    mdate;

SELECT mdate,
  team1,
  sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  sum(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2

FROM game left outer JOIN goal ON id = matchid
GROUP BY mdate,matchid,team1,team2
ORDER BY mdate,matchid,team1,team2
