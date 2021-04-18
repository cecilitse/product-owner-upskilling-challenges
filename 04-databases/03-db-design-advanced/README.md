# DB Design - Advanced

Tired of crafting complex SQL queries?
Let's get back to **database schema design**.

## Setup

Execute the following in the Terminal:

```bash
cd ~/lewagon-workshop/product-owner-upskilling-challenges/04-databases/03-db-design-advanced/
code .
```

## Exercise

In this folder, you will find `database-schema.xml` - where you will paste your database schema once done.

## Database schema

As a reminder, here is the **database schema** you'll work with in this exercise:

![Database schema](https://raw.githubusercontent.com/cecilitse/product-owner-upskilling-challenges/master/04-databases/03-db-design-advanced/database-schema.png)

## Objectives

In the first exercise, we designed our database schema from scratch. Now, the goal is to answer a few remaining questions.

Here are the new requirements:
- An employee has **one manager** who is another employee.
- An employee has to **confirm or cancel** his/her participation to a team building session. By default, he/she is just invited by the person who created the team building session.
- The **price** of an activity can change. In which way team building sessions are impacted? How to prevent it?
- In the previous execise, we crafted a SQL query to compute the **total expenses** made by a team. With a lot of data, such query could become expensive to execute. How could we prevent that?
- Same question for the **number of team building sessions** done by a site.

Ok it's your turn!

Go to [WWW SQL Designer](https://ondras.zarovi.cz/sql/demo/), load the existing database schema and update it based on the new requirements.

⚠ **WARNING:** If you refresh or close the page, you will **lose** all your work. So be careful!

## Loading the database schema

Here are the steps to load your existing database schema:

- In your code editor, open the `database-schema.xml` file
- Copy all its content
- On the top right of the WWW SQL Designer page, click on `Save / Load`
- In the modal, in the `Input / Output` area, paste the content you just copied
- Then, click on `LOAD XML` button
- You're now ready to update the schema

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
