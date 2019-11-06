categories = [
  "Adventure",
  "Sport",
  "Visits",
  "Workshops",
  "Cultural",
  "Food"
]
puts "Can you please add a category to this list: #{categories}?"
categories = (categories << gets.chomp).sort
puts "The list of the categories is now:\n"
categories.each do |name|
  puts "- #{name}"
end
puts "\n There are #{categories.size} categories filled in the list"
