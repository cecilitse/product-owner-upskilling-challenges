---------------------------------------
-- [THE BASICS]
---------------------------------------

-- Get all sites
-- TODO: SELECT ...
SELECT * FROM sites;

-- Get all sites sorted by name
-- TODO: SELECT ...
SELECT * FROM sites ORDER BY name DESC ;
SELECT * FROM sites ORDER BY name ASC ;

-- Gett all activity names sorted by name
-- TODO: SELECT ...
SELECT * FROM activities ORDER BY name;

-- Get all "Sport" activities
-- TODO: SELECT ...
-- Expected result: 8 rows
SELECT * FROM activities
WHERE category="Sport";

-- Get all Escape Games in Nantes
-- TODO: SELECT ...
-- Expected result: 3 rows
SELECT * FROM activities
WHERE category="Sport" AND city="Nantes";

---------------------------------------
-- [AGGREGATES]
---------------------------------------

-- Count all the activities
-- TODO: SELECT ...
-- Expected result: 44
SELECT COUNT (*) FROM activities ;

-- Count all "Adventure" activities
-- TODO: SELECT ...
-- Expected result: 13
SELECT COUNT (*) FROM activities
WHERE category="Adventure" ;


-- Count the number of activities per category
-- TODO: SELECT ...
-- Expected result:
-- category    total
-- ----------  ----------
-- Adventure   13
-- Cultural    6
-- Food        6
-- Sport       8
-- Visits      5
-- Workshops   6
SELECT COUNT (*) as total, category
FROM activities
GROUP BY category
;

-- Get the 3 category names with the biggest number of activities
-- TODO: SELECT ...
-- Expected result:
-- category    total
-- ----------  ----------
-- Adventure   13
-- Sport       8
-- Cultural    6

SELECT COUNT (*) as total, category
FROM activities
GROUP BY category
ORDER BY total DESC
LIMIT 3
;


---------------------------------------
-- [JOINS]
---------------------------------------

-- Get all employee names working FROM site "Ile de Nantes", sorted by first name
-- TODO: SELECT ...
-- Expected result: 53 rows
SELECT * from employees INNER JOIN sites ON sites.id = employees.site_id
WHERE sites.name = "Ile de Nantes"
ORDER BY employees.first_name
;

-- Get all the activity names where you have been to, sorted by name
-- TODO: SELECT ...
-- Expected result: well, it depends on who you are :)
SELECT * from activities
JOIN team_building_sessions ON activities.id = team_building_sessions.activity_id
JOIN participations ON participations.team_building_session_id = team_building_sessions.id
JOIN employees ON employees.id = participations.employee_id
WHERE employees.last_name ="Lebois"
ORDER BY activities.name
;

-- [NEW KEYWORD] Get all the team names that have done an Adventure activity, sorted by names
-- TODO: SELECT ...
-- Expected result:
-- name
-- --------------------
-- Business Development
-- Product Owner
-- R&D
SELECT DISTINCT teams.name  from teams
JOIN team_building_sessions ON teams.id = team_building_sessions.team_id
JOIN activities ON team_building_sessions.activity_id = activities.id
where activities.category = "Adventure"
order by teams.name
;



-- Get the team names and total number of team building sessions done, sorted by top teams
-- TODO: SELECT ...
-- Expected result:
-- name        total_sessions
-- ----------  --------------
-- R&D         7
-- Marketing   4
-- Business D  3
-- Product Ow  3
-- Finance &   2
-- UI / UX     2
-- Customer S  1
SELECT teams.name, COUNT(team_building_sessions.id) as session_number
FROM teams
JOIN team_building_sessions ON teams.id = team_building_sessions.team_id
GROUP BY teams.name
ORDER BY session_number DESC
;

-- Get all the employee names, team names and site names that have never attended a team building session
-- TODO: SELECT ...
-- Expected result:
-- first_name  last_name   team        site
-- ----------  ----------  ----------  -----------
-- Harmony     Florin      Channels    Paris 13ème
-- Julia       Ivanets     Channels    Paris 13ème
-- Pierre      Pellan      Channels    Paris 13ème
SELECT employees.first_name, employees.last_name, teams.name as team, sites.name as site FROM employees
LEFT OUTER JOIN participations ON employees.id = participations.employee_id
JOIN sites ON employees.site_id = sites.id
JOIN teams ON teams.id = employees.team_id
WHERE team_building_session_id is NULL
;

-- [NEW AGGREGATE] Get the budget spent on team building sessions per team, sorted by most expensive to leASt expensive
-- TODO: SELECT ...
-- Expected result:
-- name          total_price
-- ------------  -----------
-- Finance & RH  1620
-- Business Dev  1446
-- R&D           1140
-- Marketing     445
-- Customer Suc  360
-- Product Owne  267
-- UI / UX       240
SELECT  teams.name ,SUM(price) as total_price FROM teams
JOIN team_building_sessions ON teams.id = team_building_sessions.team_id
GROUP BY teams.name
ORDER BY total_price DESC
;

-- Get the site names and total number of team building sessions done, sorted by top sites
-- TODO: SELECT ...
-- Expected result:
-- name           total_sessions
-- -------------  --------------
-- Ile de Nantes  12
-- Paris 13ème    10
SELECT  sites.name , COUNT(DISTINCT team_building_sessions.id) as total_sessions
FROM sites
JOIN employees ON employees.site_id = sites.id
JOIN participations ON participations.employee_id = employees.id
JOIN team_building_sessions ON team_building_sessions.id = participations.team_building_session_id
GROUP BY name
;
