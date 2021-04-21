puts "What is your name?"
name = gets.chomp # asks user to type something in the Terminal

puts "Ok got it!"

# TODO: your code goes here
puts "What is your year of birth?"
year = gets.chomp # asks user to type something in the Terminal

puts "Ok got it!"

age = 2021 - year.to_i

puts "Hey #{name}! You are #{age} years old this year."
