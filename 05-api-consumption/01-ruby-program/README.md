# Consuming API from Ruby

You've already requested the Team Building API but from Postman. In this exercise, we'll call the API from a **Ruby program**.

## Setup

Execute the following in the Terminal:

```bash
cd ~/lewagon-workshop/product-owner-upskilling-challenges/05-api-consumption/01-ruby-program/
code .
```

## Exercise

In this folder, you will find:

- `search_employee.rb` - The first part of the exercise
- `employees_by_team.rb` - The second part of the exercise

## Objectives

The goal of this exercise is to implement some of our Postman requests as a Ruby program.

### Searching an employee

You will work in the `search_employee.rb` file.

Here is the expected behavior:

1. The user of your program is invited to type the name of the employee he/she is looking for.
2. Your program calls the API.
3. It displays in the Terminal the employee's details.

For instance:

- When typing `Laura Olive`
- It should display something like:

```text
Laura Olive (UX designer)
From team UI / UX
Working from Paris 13ème
```

The first part, asking for the name, is already done for you.

Try it out! Run the Ruby file from the Terminal:

```bash
ruby search_employee.rb
```

Now it's your turn, complete the exercise.

### Looking for employees by team

You will work in the `employees_by_team.rb` file.

This one is a bit more complicated since you'll have to call several endpoints.

Here is the expected behavior:

1. The user is invited to type the name of a team.
2. Your program calls any relevant endpoint of the API.
3. It displays in the Terminal all the employees having the requested role.

For instance:

- When typing `UI / UX`
- It should display something like:

```text
Total: 5 people found

Clément Troadec
UI/UX designer
---
Jérémie Biron
Intégrateur/UI
---
Laura Olive
UX Designer
---
Mélanie Foucher
UX designer
---
Sandy Goldscheid
Responsable Us
---
```

The first part, asking for the team, is already done for you.

Try it out! Run the Ruby file from the Terminal:

```bash
ruby employees_by_team.rb
```

Now it's your turn, complete the exercise.

## Git Commit

When you're done, don't forget to **commit and push** your changes.

## Hints

Have a look at your Postman requests and try to transpose them into the Ruby world.
