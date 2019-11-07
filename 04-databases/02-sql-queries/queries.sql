---------------------------------------
-- [THE BASICS]
---------------------------------------

-- Get all sites
-- TODO: SELECT * FROM sites;

-- Get all sites sorted by name
-- TODO: SELECT * FROM sites ORDER BY name;

-- Get all activity names sorted by name
-- TODO: SELECT * FROM activities ORDER BY name;

-- Get all "Sport" activities
-- TODO: SELECT * FROM activities WHERE category = 'Sport';
-- Expected result: 8 rows

-- Get all Escape Games in Nantes
-- TODO: SELECT * FROM activities WHERE name LIKE '%Escape Game%' AND city = 'Nantes';
-- Expected result: 3 rows

---------------------------------------
-- [AGGREGATES]
---------------------------------------

-- Count all the activities
-- TODO: SELECT * FROM activities;
-- Expected result: 44

-- Count all "Adventure" activities
-- TODO: SELECT * FROM activities WHERE category = 'Adventure';
-- Expected result: 13

-- Count the number of activities per category
-- TODO: SELECT count(*), category FROM activities GROUP BY category;
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
-- TODO: SELECT count(*) AS total, category FROM activities GROUP BY category ORDER BY total DESC LIMIT 3;
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
-- TODO: SELECT employees.last_name FROM employees JOIN sites ON employees.site_id = sites.id WHERE sites.name = 'Ile de Nantes' ORDER BY employees.first_name;
-- Expected result: 53 rows

-- Get all the activity names where you have been to, sorted by name
-- TODO: SELECT activities.name FROM activities JOIN team_building_sessions ON activities.id = team_building_sessions.activity_id JOIN participations ON participations.team_building_session_id JOIN employees ON employees.id = participations.employee_id WHERE employees.last_name = 'Roubin' ORDER BY activities.name;
-- Expected result: well, it depends on who you are :)

-- [NEW KEYWORD] Get all the team names that have done an Adventure activity, sorted by names
-- TODO: SELECT DISTINCT teams.name FROM teams JOIN team_building_sessions ON team_building_sessions.team_id = teams.id JOIN activities ON activities.id = team_building_sessions.activity_id WHERE activities.category = 'Adventure' ORDER BY teams.name;
-- Expected result:
-- name
-- --------------------
-- Business Development
-- Product Owner
-- R&D

-- Get the team names and total number of team building sessions done, sorted by top teams
-- TODO: SELECT teams.name, count(*) AS total_sessions FROM team_building_sessions JOIN teams ON team_building_sessions.team_id = teams.id GROUP BY teams.name ORDER BY total_sessions DESC;
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
-- TODO: SELECT employees.first_name, employees.last_name, teams.name, sites.name FROM employees JOIN teams ON employees.team_id = teams.id JOIN sites ON sites.id = employees.site_id LEFT JOIN participations ON participations.employee_id = employees.id WHERE participations.id IS NULL;
-- Expected result:
-- first_name  last_name   team        site
-- ----------  ----------  ----------  -----------
-- Harmony     Florin      Channels    Paris 13ème
-- Julia       Ivanets     Channels    Paris 13ème
-- Pierre      Pellan      Channels    Paris 13ème

-- [NEW AGGREGATE] Get the budget spent on team building sessions per team, sorted by most expensive to least expensive
-- TODO: SELECT SUM(price) AS total_price, teams.name FROM team_building_sessions JOIN teams ON team_building_sessions.team_id = teams.id GROUP BY teams.name ORDER BY total_price DESC;
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
-- TODO: SELECT sites.name, COUNT(DISTINCT team_building_sessions.id) AS total_sessions FROM sites JOIN employees ON employees.site_id = sites.id JOIN participations ON participations.employee_id = employees.id JOIN team_building_sessions ON team_building_sessions.id = participations.team_building_session_id GROUP BY sites.name ORDER BY total_sessions DESC;
-- Expected result:
-- name           total_sessions
-- -------------  --------------
-- Ile de Nantes  12
-- Paris 13ème    10
