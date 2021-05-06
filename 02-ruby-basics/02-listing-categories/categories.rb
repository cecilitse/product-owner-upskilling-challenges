categories = ["Adventure",
              "Sport",
              "Visits",
              "Workshops",
              "Cultural",
              "Food"
            ]

# Ask the user to enter an extra category
puts "Could you please give me an activity you would like to do for the team building ?"
activity= gets.chomp

categories = categories << "#{activity}"

#reorder the list
categories = categories.sort
#calculate the number of categories
nb_categories = categories.size

#display the elements
puts ""
puts "[Categories of activity]"
puts categories
puts ""
puts "Total = #{nb_categories}"
