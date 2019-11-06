activity = {
  "name" => "Visite de Nantes",
  "category" => "Visits",
  "city" => "Nantes",
  "duration" => 120,
  "number_of_participants" => 10,
  "price" => 100
}


# TODO: your code goes here

puts "#{activity["name"]} [#{activity["category"].upcase}]"
puts "Located in #{activity["city"]}"
puts "Duration of #{activity["duration"]} minutes"
puts "For #{activity["number_of_participants"]} participants"
puts "Charged #{activity["price"]}€"
