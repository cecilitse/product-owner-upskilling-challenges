puts "What is your name?"
name = gets.chomp # asks user to type something in the Terminal

puts "Ok got it!"

# TODO: your code goes here
puts "What is your year of birth?"
yob = gets.chomp.to_i

puts "Ok let me guess your age..."

age = 2019 - yob

puts "Hey #{name}! You are #{age} yo this year."
