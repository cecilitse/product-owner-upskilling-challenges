categories = [
  # TODO: gather the categories of activity
  "Adventure", "Sport", "Visits", "Workshops", "Cultural", "Food"
]

# TODO: your code goes here
puts "Please enter an activity"
added_category = gets.chomp

categories << added_category

sorted_categories = categories.sort

puts "[CATEGORIES OF ACTIVITIES]"
sorted_categories.each do |activity|
  puts "- #{activity}"
end

puts "Total: #{sorted_categories.size}"
