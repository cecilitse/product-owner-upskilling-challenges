# What is your age

In this first Ruby exercise, we'll get familiar with our new environment: irb, a Ruby file, debugging, etc.

## Setup

First things first, let's go within the exercise folder and open the code editor.

Execute the following in the Terminal:

```bash
cd ~/lewagon-workshop/product-owner-upskilling-challenges/02-ruby-basics/01-what-is-your-age/
code .
```

## Exercise

In this folder, you will find:

- `age.rb` - The Ruby boilerplate of the exercise

You will work in this `age.rb` file.

## Objectives

The goal is to compute the age of the person that uses our program.

Here is the expected behavior of the program:

1. Ask the person his/her name
2. Ask the person his/her year of birth
3. Compute the age of the person
4. Display the name and age of the person

For instance:

- Given we are in `2019`
- If the person enters `Bob` as name and `1941` as year of birth
- It should display something like: `Hey Bob! You are 78 years old this year.`

The first part, asking for the name, is already done for you.

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

### puts VS p

We use `puts` to display something to the user of our program.

However, as developer, if we want to print something to check the output, we use `p`.

```ruby
puts "Hello World"  # => Hello World
p "Hello World"     # => "Hello World"

puts "7" 	# => 7
p "7" 	 	# => "7" # so we know it's a String

puts ["Bob", "Janis"]
# => Bob
#    Janis
p ["Bob", "Janis"] 	# => ["Bob", "Janis"]
```

So, use `p` while debugging but then only use `puts` when you want to display something to the user.

Note that `p` lines should be **removed afterwards**.

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

A few things to notice here on the **last line**:

- It contains the **name** of the file that crashed: `hello.rb`
- It contains the **line** where it crashed: `4`
- It contains the **error** name: `TypeError`
- It contains a **description** of the problem: `in '+': nil can't be coerced into Integer`

What's happening here is that Ruby is trying to **help us** find the cause of our problem.

Literally, here Ruby is trying to tell us that we tried to sum an Integer (`42`) with `nil`, and this is happening on line `4`.

It's now our turn to be debugging detectives, and use these clues to find our culprit

Here is line 4: `total = students + teachers`
The problem is near the `+`, so either `students` is `nil`, or `teachers` is.

We just have to retrace our code steps and tada! On line 2, `teachers` is defined as `nil`. Here's our culprit! We can fix it by changing its value to an `Integer`.

This time the program shouldn't crash.

That's how we debug!
