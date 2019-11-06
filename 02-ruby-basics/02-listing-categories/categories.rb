categories = ["Adventure", "Sport", "Visits", "Workshops", "Cultural", "Food"]

puts "Please add a new activity"
categories << gets.chomp

categories.sort.each do |name|
  puts "- #{name}"
end

puts "Total = #{categories.size}"
