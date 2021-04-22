---------------------------------------
-- [THE BASICS]
---------------------------------------

-- Get all sites
select * from sites;

-- Get all sites sorted by name
-select * from sites order  by name;

-- Get all activity names sorted by name
select * from activities order by name;

-- Get all "Sport" activities
select * from activities where category="Sport";
-- Expected result: 8 rows

-- Get all Escape Games in Nantes
select * from activities where city="Nantes" and name like "%Escape Game%";
-- Expected result: 3 rows

---------------------------------------
-- [AGGREGATES]
---------------------------------------

-- Count all the activities
select count(*) from activities;
-- Expected result: 44

-- Count all "Adventure" activities
select count(*) from activities where category="Adventure";
-- Expected result: 13

-- Count the number of activities per category
select category, count(*) as total from activities group by category;
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
select category, count(*) as total from activities group by category order by total desc limit 3;
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
select first_name, last_name
from employees
join sites on sites.id=employees.site_id
where sites.name="Graslin"
order by first_name;
-- Expected result: 53 rows

-- Get all the activity names where you have been to, sorted by name
-- I'm not in the data base so I took Gilles Satgé id = 34
select activities.name
from activities
join team_building_sessions on team_building_sessions.activity_id=activities.id
join participations on participations.team_building_session_id=team_building_sessions.id
join employees on employees.id=participations.employee_id
where employees.id=34
order by activities.name;
-- Expected result: well, it depends on who you are :)

--[NEW KEYWORD] select distinct to avoid duplicates
-- Get all the team names that have done an Adventure activity, sorted by names
select distinct teams.name
from teams
join team_building_sessions on team_building_sessions.team_id=teams.id
join activities on activities.id=team_building_sessions.activity_id
where activities.category="Adventure"
order by teams.name;
-- Expected result:
-- name
-- --------------------
-- Business Development
-- Product Owner
-- R&D

-- Get the team names and total number of team building sessions done, sorted by top teams
select team.name, count(team_building_sessions.id) as total_sessions
from teams
join team_building_sessions on team_building_sessions
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
