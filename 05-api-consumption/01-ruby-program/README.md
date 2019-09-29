# Consuming API from Ruby

You've already requested the Lucca API but from Postman. In this exercise, we'll call the API from a **Ruby program**.

## Setup

Execute the following in the Terminal:

```bash
cd ~/lewagon-workshop/05-api-consumption/01-ruby-program/
code .
```

## Exercise

In this folder, you will find:

- `search_user.rb` - The first part of the exercise
- `users_by_role.rb` - The second part of the exercise

## Objectives

The goal of this exercise is to implement some of our Postman requests as a Ruby program.

### Searching a user

You will work in the `search_user.rb` file.

Here is the expected behavior:

1. The user of your program is invited to type the name of the person he/she is looking for.
2. Your program calls the API.
3. It displays in the Terminal the person's details.


For instance:

- When typing `Lilly Evans`
- It should display something like:

```text
Lilly Evans (levans@example.org)
Business Developer
From department of Sales
```

The first part, asking for the name, is already done for you.

Try it out! Run the Ruby file from the Terminal:

```bash
ruby search_user.rb
```

Now it's your turn, complete the exercise.

### Looking for users by role

You will work in the `users_by_role.rb` file.

This one is a bit more complicated since you'll have to call several endpoints.

Here is the expected behavior:

1. The user is invited to type the name of a role.
2. Your program calls any relevant endpoint of the API.
3. It displays in the Terminal all the users having the requested role.


For instance:

- When typing `Figgo - Manager`
- It should display something like:

```text
Total: 5 people found

Antoine Beaulinette
Directeur Administratif et Financier
---
Maurice Bouchard
Assistant de Direction
---
Marie Bragoulet
Responsable R&D
---
Michel Constant
Directeur Commercial
---
Alexander Doherty
Responsable commercial UK
---
```

The first part, asking for the role, is already done for you.

Try it out! Run the Ruby file from the Terminal:

```bash
ruby users_by_role.rb
```

Now it's your turn, complete the exercise.

## Git Commit

When you're done, don't forget to **commit and push** your changes.

## Hints

Have a look at your Postman requests and try to transpose them into the Ruby world.
