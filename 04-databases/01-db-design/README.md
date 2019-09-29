# DB Design

It's time for you to design your first **database schema**.

As a reminder, our guiding theme is activities for team building sessions.

## Setup

Execute the following in the Terminal:

```bash
cd ~/lewagon-workshop/04-databases/01-db-design/
code .
```

## Exercise

In this folder, you will find `database-schema.xml` - where you will paste your database schema once done.

## Objectives

The goal is to design a database schema based on the requirements provided by the Product Owner 😉

We'll have to store the activities of course but also the team building sessions, employees, teams, etc.

Here are the full requirements:
- The application lists several activities
- A team building session is created for one specific activity, one specific team and at a specific date
- A team is defined by its name (e.g. the `Marketing` team)
- A team is composed of several employees
- An employee is defined by his/her first name, last name, job title and has a picture URL
- An employee is attached to only one team and one site
- A site is defined by its name (e.g. `Ile de Nantes`), address (e.g. `1-3 Rue Michel Columb`), zip code and city
- As we already know, an activity is defined by a name, category, city, duration (in minutes), number of participants, price (in euros) and has a photo URL
- It is possible that some employees of a team are not participating in a team building session (e.g. the ones on holidays, on sick leave or not on the same site)

Ok it's your turn!

Go to [WWW SQL Designer](https://ondras.zarovi.cz/sql/demo/) and design the database schema.

⚠ **WARNING:** If you refresh or close the page, you will **lose** all your work. So be careful!

## Saving the database schema

Here are the steps to export your database schema:

- On the top right of the page, click on `Save / Load`
- In the modal, click on `SAVE XML` button
- Copy all the generated text from the `Input / Output` section
- In your code editor, open the `database-schema.xml` file
- Paste everything within this file
- Save your file

## Git Commit

When you're done, don't forget to **commit and push** your changes.
