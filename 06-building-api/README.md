# Building an API

Here we are, you'll build and consume your own version of the Team Building API.

## Setup

Execute the following in the Terminal:

```bash
cd ~/lewagon-workshop/product-owner-upskilling-challenges/06-building-api/
code .
```

## Exercise

In this folder, you will find a Sinatra application. Let's have a look at the new files and folders:

- `db/` - This folder contains your SQLite database file.
- `views/` - It contains a `doc/` folder. Those are all the documentation pages.

You will work in the `app.rb` file.

## Installing the plugins

We have already installed the required Ruby plugins to run the sinatra web application but we are missing `sqlite3`.

Execute the following in the Terminal to install it:

```bash
bundle add sqlite3
```

## Launching the Sinatra app

Here is a recap on how to launch a Sinatra application.

Type the following in the Terminal:

```bash
ruby app.rb
```

To stop the app, type `Ctrl + c`

⚠ **NOTE:** While the app is running, you can't type anything within your Terminal. If you need to have access to a second Terminal, open a new tab.

## The database

As a reminder, here is the **database schema** you'll work with in this exercise:

![Database schema](https://raw.githubusercontent.com/cecilitse/product-owner-upskilling-challenges/master/04-databases/02-sql-queries/database-schema.png)

## Objectives

The goal is to recreate the [Team Building API](https://team-building-api.cleverapps.io/)
In the exercise, you have the documentation from the original API, feel free to have a look at it in order to recreate the API.

The documentation is located at [localhost:4567/doc](http://localhost:4567/doc)

### List all activities

Let's focus on implementing the Version 1 of the API.
First step, implement the listing of all the activities.

Find back the SQL query from previous SQL exercise and implement the endpoint in the `v1` namespace.

To test your API, either access to the correct URL in your browser or use Postman.
For Postman, just replace `https://team-building-api.cleverapps.io` by `http://localhost:4567`

### Details of one activity

Second step, implement the next endpoint of the Version 1: get the details of an activity.
As a reminder, the endpoint URL is based on the ID of the activity we're looking for.

To do this, you'll also need to use **parameters**.

### Filter activities

This feature is only available within the Version 2.
First, duplicate your `v1` namespace and rename the copy into `v2`.

Now, change the code of the listing of the activities so that is complies with the documentation of the Version 2.

⚠ **Note:** Don't forget that in the end you can **combine** the filters. As a first step, try to make the filters work one at a time. Then make the combination possible.

## Hints

### Control flow in Ruby

For the last endpoint, you'll need to manage different use cases: no filters provided, only the category provided, only the city provided, etc. To do that, we'll use **control flow**.

Here is the basic syntax:

```ruby
if condition1
  # some code
elsif condition2
  # some other code
else
  # default code
end
```

You can have as many conditions as you want.

And you can have all flavors of this syntax:

```ruby
if only_one_condition
  # some code
end

if only_one_condition
  # some code
else
  # default code
end
```

Here are more practical examples:

```ruby
puts "What is your age?"
age = gets.chomp.to_i

if age >= 18
  puts "You can vote!"
else
  puts "Sorry, you're too young to vote..."
end
```

```ruby
puts "What time is it?"
hour = gets.chomp.to_i

if hour < 12
  puts "Good morning!"
elsif hour > 12
  puts "Good afternoon!"
elsif hour >= 20
  puts "Good night!"
else
  puts "Lunch time!"
end
```

### Expressing the opposite

The `!` keyword is used to express negation.

For instance:

- `if age != 18` means that age is **not** equal to 18.
- `if !age.even?` means the age is **not** even.

### Multiple conditions

You can combine multiple conditions within a `if` statement. To do that, we use `&&` and `||` operators.

`&&` means **AND** while `||` means **OR**.

Here is a quite exhaustive example:

```ruby
if hour == 17 && age < 18
  puts "It's snack time!"
elsif hour == 17 && age >= 18 && age <= 65
  puts "It's wine o'clock"
elsif hour == 17
  puts "It's tea time!"
elsif age < 18 && (hour < 8 || hour > 22)
  puts "Go back to bed!"
else
 puts "Have a nice day"
end
```

Here is how Ruby computes two conditions:

```ruby
# AND
true  && true             # => true
false && false            # => false
true  && false            # => false
false && true             # => false
true  && false && true    # => false # all should be true
```

```ruby
# OR
true  || true            # => true
false || false           # => false
true  || false           # => true
false || true            # => true
true  || false || true   # => true # at least one is true
```
