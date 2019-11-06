currentYear = Time.now.year
puts "What is your name?"
name = gets.chomp # asks user to type something in the Terminal
puts "Ok got it!"
puts "Whats is the year of your birth?"
year = gets.chomp.to_i
puts "Thank you for that"

age = currentYear - year

puts "Hey #{name}! You are #{age} years old this year."
