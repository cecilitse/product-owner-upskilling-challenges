# Listing of activities

In the previous two exercises, we've played with both `Array` and `Hash` but in isolation. In this exercise, we'll combine them together.

## Setup

Execute the following in the Terminal:

```bash
cd ~/lewagon-workshop/02-ruby-basics/04-listing-of-activities/
code .
```

## Exercise

In this folder, you will find `listing.rb` - The Ruby boilerplate of the exercise.

## Objectives

The goal is to display a list of activities.

A list of activities is represented by an `Array` containing one `Hash` per activity.

As a comparison, here is an example of a list of artists:

```ruby
artists = [
  { "name" => "Bob", "genre" => "Folk" },
  { "name" => "Alanis", "genre" => "Rock" }
]
```

First step, complete the list of activities with at least 3 activities. Then display them.

Here is the expected output for 2 activities:

```
Escape Game [ADVENTURE]
Located in Nantes
Duration of 60 minutes
For 4 participants
Charged 120€
---
Wine Tasting [FOOD]
Located in Paris
Duration of 90 minutes
For 15 participants
Charged 300€
---
```

## Git Commit

When you're done, don't forget to **commit and push** your changes.
