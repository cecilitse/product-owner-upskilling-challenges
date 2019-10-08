# SQL Queries

In this exercise, we'll get used to the art of crafting SQL queries.

There are way too many queries, try to go as far as you can but with no pressure since it's impossible to cover all of them.

## Setup

Execute the following in the Terminal:

```bash
cd ~/lewagon-workshop/product-owner-upskilling-challenges/04-databases/02-sql-queries/
code .
```

## Exercise

In this folder, you will find:

- `team_building.sqlite` - it's the database containing all the data we want to query.
- `queries.sql` - the expected queries

You'll work in the `queries.sql` file. You'll write down all the queries you've found so far.

## SQLite

There are plenty of different SQL databases.
Just to list a few, we have: SQLite, PostgreSQL, MySQL, etc.

During this workshop, we'll use **SQLite** because of its simplicity of setup and usage since the database is stored within a file.

Check that it is installed by typing in the Terminal:

```bash
sqlite3
```

If you see `sqlite>` then it's working.
Otherwise ask for help.

To quit, type `.quit` or (`Ctrl + d` for macOS / Linux)

## DB Browser for SQLite

To visualize our data in an easier way, we'll also use a software called SQLite Browser.

Check that you have it installed. Otherwise, download and install it from: [https://sqlitebrowser.org](https://sqlitebrowser.org)

## The database

Here is the **database schema** you'll work with in this exercise:

![Database schema](https://raw.githubusercontent.com/cecilitse/product-owner-upskilling-challenges/master/04-databases/02-sql-queries/database-schema.png)

Some **stats** about the data inside:
- 2 sites
- 8 teams
- 2 teams spread on two sites: R&D and Product Owner
- 114 employees
- 44 activities
- 22 team building sessions
- 194 participations

## Objectives

The goal is to query the provided `team_building.sqlite` database. You'll find the expected queries within the `queries.sql` file.

How to test your queries? There are 2 options: either use the `sqlite3` command line or use the DB Browser software. See below.

For each query, once you've found it, just write it down within the `queries.sql` file.

### Sqlite3

In the Terminal, type:

```bash
sqlite3 team_building.sqlite
```

Then enable a few options by typing:

```bash
.headers on
.mode column
```

You can then type any SQL query.

For instance, you can type:

```sql
SELECT * FROM sites;
```

To quit, type `.quit` or (`Ctrl + d` for macOS / Linux)

### DB Browser for SQLite

Launch the software, click on `File` > `Open Database` and select your database.

As a reminder, it's located here: `~/lewagon-workshop/product-owner-upskilling-challenges/04-databases/02-sql-queries/team_building.sqlite`

Then go to the `Execute SQL` tab, type your query and press ▶ (the play button).

## Git Commit

When you're done, don't forget to **commit and push** your changes.

## Hints

As a reminder, here are the most common SQL keywords and their expected order:

```sql
SELECT
FROM
JOIN
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
```

Some of them haven't been presented yet. Feel free to search for their documentation.
