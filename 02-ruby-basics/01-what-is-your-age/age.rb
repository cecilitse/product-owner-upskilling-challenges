#Get the name of the user
puts "What is your name?"
name = gets.chomp # asks user to type something in the Terminal

#Get the year of birth of the user
puts "What is your year of birth ?"
yearofbirth = gets.chomp

#Compute the age of the person
age=2021-yearofbirth.to_i

#Display the name and age of the person
puts "Hey #{name} ! You are #{age} years old this year"
