categories = ["Adventure", "Sport", "Visits", "Workshops", "Cultural", "Food"]

# TODO: your code goes here

puts "Our current categories are:"

categories.each do |activity|
  puts activity
end

puts
puts "Please add a category."

new_cat = gets.chomp
categories << new_cat

puts
puts "Our categories are:"
categories.sort.each do |activity|
  puts "-#{activity}"
end
puts
puts "Total: #{categories.size}."
