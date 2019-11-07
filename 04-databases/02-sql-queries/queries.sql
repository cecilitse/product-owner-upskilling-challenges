---------------------------------------
-- [THE BASICS]
---------------------------------------

-- Get all sites
SELECT * FROM sites;

-- Get all sites sorted by name
SELECT * FROM sites ORDER BY name;

-- Gett all activity names sorted by name
SELECT name FROM activities ORDER BY name;

-- Get all "Sport" activities
SELECT * FROM activities WHERE category LIKE '%Sport%';
-- Expected result: 8 rows

-- Get all Escape Games in Nantes
SELECT * FROM activities WHERE lower(name) LIKE lower('%Escape Game%') AND city = "Nantes"
-- Expected result: 3 rows

---------------------------------------
-- [AGGREGATES]
---------------------------------------

-- Count all the activities
SELECT count(*) as total FROM activities
-- Expected result: 44

-- Count all "Adventure" activities
SELECT count(*) as total FROM activities WHERE category = 'Adventure'
-- Expected result: 13

-- Count the number of activities per category
SELECT category, count(*) as Total FROM activities GROUP BY category
-- Expected result:
-- category    total
-- ----------  ----------
-- Adventure   13
-- Cultural    6
-- Food        6
-- Sport       8
-- Visits      5
-- Workshops   6

-- Get the 3 category names with the biggest number of activities
SELECT category, count(*) as Total FROM activities GROUP BY category ORDER BY Total desc LIMIT 3
-- Expected result:
-- category    total
-- ----------  ----------
-- Adventure   13
-- Sport       8
-- Cultural    6

---------------------------------------
-- [JOINS]
---------------------------------------

-- Get all employee names working FROM site "Ile de Nantes", sorted by first name
SELECT (e.first_name || ' ' || e.last_name) as employee_name FROM employees as e INNER JOIN sites as s ON e.site_id = s.id WHERE s.name = 'Ile de Nantes' ORDER BY e.first_name
-- Expected result: 53 rows

-- Get all the activity names where you have been to, sorted by name
SELECT name FROM activities as a
INNER JOIN team_building_sessions as t_b_s ON a.id = t_b_s.activity_id
INNER JOIN participations as p ON p.team_building_session_id = t_b_s.id
INNER JOIN employees as e ON p.employee_id = e.id
WHERE e.last_name = 'Boucrault'
ORDER BY a.name
-- Expected result: well, it depends on who you are :)

-- [NEW KEYWORD] Get all the team names that have done an Adventure activity, sorted by names
SELECT DISTINCT t.name FROM teams as t
INNER JOIN team_building_sessions as t_b_s ON t.id = t_b_s.team_id
INNER JOIN activities as a ON t_b_s.activity_id = a.id
WHERE a.category = 'Adventure'
ORDER BY t.name
-- Expected result:
-- name
-- --------------------
-- Business Development
-- Product Owner
-- R&D

-- Get the team names and total number of team building sessions done, sorted by top teams
SELECT t.name, COUNT(t_b_s.id) as number_of_sessions FROM teams as t
INNER JOIN team_building_sessions as t_b_s ON t.id = t_b_s.team_id
GROUP BY t.name
ORDER BY number_of_sessions desc
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

-- Get all the employee names, team names and site names that have never attended a team building session
SELECT DISTINCT (e.first_name || ' ' || e.last_name) as employee_name, s.name as site_name, t.name FROM sites as s
INNER JOIN employees as e ON s.id = e.site_id
INNER JOIN teams as t ON t.id = e.team_id
LEFT JOIN participations as p ON p.employee_id = e.id
WHERE team_building_session_id IS NULL
-- Expected result:
-- first_name  last_name   team        site
-- ----------  ----------  ----------  -----------
-- Harmony     Florin      Channels    Paris 13ème
-- Julia       Ivanets     Channels    Paris 13ème
-- Pierre      Pellan      Channels    Paris 13ème

-- [NEW AGGREGATE] Get the budget spent on team building sessions per team, sorted by most expensive to leASt expensive
SELECT t.name, SUM(a.price) as total_budget FROM activities as a
INNER JOIN team_building_sessions as tbs ON a.id = tbs.activity_id
INNER JOIN teams as t ON t.id = tbs.team_id
GROUP BY team_id
ORDER BY total_budget desc
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

-- Get the site names and total number of team building sessions done, sorted by top sites
SELECT s.name, COUNT(DISTINCT p.team_building_session_id) as total FROM sites as s
INNER JOIN employees as e ON s.id = e.site_id
INNER JOIN participations as p ON p.employee_id = e.id
INNER JOIN team_building_sessions as tbs ON tbs.id = p.team_building_session_id
GROUP BY s.name
ORDER BY total desc
-- Expected result:
-- name           total_sessions
-- -------------  --------------
-- Ile de Nantes  12
-- Paris 13ème    10
