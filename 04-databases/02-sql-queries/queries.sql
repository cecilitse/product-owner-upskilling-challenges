---------------------------------------
-- [THE BASICS]
---------------------------------------

-- Get all sites
SELECT * FROM sites;

-- Get all sites sorted by name
SELECT * FROM sites ORDER BY name;

-- Gett all activity names sorted by name
SELECT * FROM activities ORDER BY name;

-- Get all "Sport" activities
 SELECT * FROM activities WHERE category = "Sport";
-- Expected result: 8 rows

-- Get all Escape Games in Nantes
SELECT * FROM activities WHERE city = "Nantes" AND name LIKE "%Escape Game%";
-- Expected result: 3 rows

---------------------------------------
-- [AGGREGATES]
---------------------------------------

-- Count all the activities
SELECT COUNT(*) AS Total FROM activities;
-- Expected result: 44

-- Count all "Adventure" activities
SELECT COUNT(*) AS Total FROM activities WHERE category = "Adventure";
-- Expected result: 13

-- Count the number of activities per category
SELECT category, COUNT(*) FROM activities GROUP BY category;
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
 SELECT category, COUNT(*) as Total FROM activities GROUP BY category ORDER BY Total DESC LIMIT 3;
-- Expected result:
-- category    total
-- ----------  ----------
-- Adventure   13
-- Sport       8
-- Cultural    6

---------------------------------------
-- [JOINS]
---------------------------------------

-- Get all employee names working FROM site "Graslin", sorted by first name
 SELECT employees.first_name, employees.last_name FROM employees
 JOIN sites ON sites.id = employees.site_id WHERE name = "Graslin" ORDER BY employees.first_name;
-- Expected result: 53 rows

-- Get all the activity names where you have been to, sorted by name
SELECT name FROM activities
JOIN team_building_sessions ON team_building_sessions.activity_id = activities.id
JOIN participations ON team_building_sessions.id = participations.team_building_session_id
JOIN employees ON participations.employee_id = employees.id
WHERE employees.first_name = "Gilles" AND employees.last_name = "Satgé" ORDER BY activities.name;
-- Expected result: well, it depends on who you are :)

-- [NEW KEYWORD] Get all the team names that have done an Adventure activity, sorted by names
-- TODO: SELECT ...
-- Expected result:
-- name
-- --------------------
-- Business Development
-- Product Owner
-- R&D

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

-- Get all the employee names, team names and site names that have never attended a team building session
-- TODO: SELECT ...
-- Expected result:
-- first_name  last_name   team        site
-- ----------  ----------  ----------  -----------
-- Harmony     Florin      Channels    Paris 13ème
-- Julia       Ivanets     Channels    Paris 13ème
-- Pierre      Pellan      Channels    Paris 13ème

-- [NEW AGGREGATE] Get the budget spent on team building sessions per team, sorted by most expensive to least expensive
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

-- Get the site names and total number of team building sessions done, sorted by top sites
-- TODO: SELECT ...
-- Expected result:
-- name           total_sessions
-- -------------  --------------
-- Graslin        12
-- Paris 13ème    10
