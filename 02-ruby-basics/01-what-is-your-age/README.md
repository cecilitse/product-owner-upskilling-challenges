# What is your age

In this first Ruby exercise, we'll get familiar with our new environment: irb, a Ruby file, debugging, etc.

## Setup

First things first, let's go within the exercise folder and open the code editor.

Execute the following in the Terminal:

```bash
cd ~/lewagon-workshop/02-ruby-basics/01-what-is-your-age/
code .
```

## Exercise

In this folder, you will find:

- `age.rb` - The Ruby boilerplate of the exercise

You will work in this `age.rb` file.

## Objectives

The goal is to calculate the age of the person that uses our program.

Here is the expected behavior of the program:

1. Ask the person his/her name
2. Ask the person his/her year of birth
3. Compute the age of the person
4. Display the name and age of the person

For instance:

- Given we are in `2019`
- If the person enters `Bob` as name and `1941` as year of birth
- It should display something like: `Hey Bob! You are 78 years old this year.`

The first part, asking for the name, is already provided.

Try it out! Run the Ruby file from the Terminal:

```bash
ruby age.rb
```

Now it's your turn, complete the exercise.

## Git Commit

When you're done, don't forget to **commit and push** your changes.

## Hints

### IRB

Don't forget to first test things directly within the Ruby interpreter.

In the terminal, just type `irb`

To quit the interpreter, type `exit` or just `Ctrl + d`

### puts

IRB is really nice. When we submit a Ruby operation, it executes it and displays directly the result within the Terminal.

Keep in mind that it's not the case when executing a Ruby file from the Terminal.

So, if you want to **display something** in the Terminal, you should use `puts`


```ruby
# hello.rb
puts "Hello World"
```

## Debugging

Given the following code:

```ruby
# hello.rb
students = 42
teachers = nil

total = students + teachers

puts "Total count of people here:"
puts total
```

When executing this file, this will **crash** with the following error details:

```
Traceback (most recent call last):
	1: from hello.rb:4:in `<main>'
hello.rb:4:in `+': nil can't be coerced into Integer (TypeError)
```

It's a **bug**.

A few things to note here on the **last line**:

- It contains the **name** of the file that crashed: `hello.rb`
- It contains the **line** where it crashed: `4`
- It contains the **error** name: `TypeError`
- It contains a **description** of the problem: `in '+': nil can't be coerced into Integer`

What's happening here is that Ruby is trying to **help us** find the cause of our problem.

Literally, here Ruby is trying to tell us that we tried to make a sum between an Integer (`42`) and `nil` and it's happening line `4`.

It's our turn to put our detective glasses and go for a search on the culprit.

Here is line 4: `total = students + teachers`
The problem is near the `+`, so either `students` is `nil` or it is `teachers` that is `nil`

We just have to investigate more and find out that it's `teachers` that is defined line 2 with a `nil` value. We can fix it by changing its value to an `Integer`.

This time the program shouldn't crash.

That's how we debug!