puts categories = ["Adventure", "Sport", "Visits", "Workshops", "Cultural"
]

puts "Add an extra category"

catsup = gets.chomp

categories = categories << catsup

puts categories
puts "Total : #{categories.size}"
