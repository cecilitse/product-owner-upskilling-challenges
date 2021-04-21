activity = {
  "name" => "Escape Game",
  "category" => "Adventure",
  "city" => "Nantes",
  "duration" => 60,
  "number of participants" => 4,
  "price" => 125
}

# TODO: your code goes here
puts "#{activity["name"]} [#{activity["category"].upcase}]"
puts "Located in #{activity["city"]}"
puts "Duration of #{activity["duration"]} minutes"
puts "For #{activity["number of participants"]} participants"
puts "Charged #{activity["price"]}€"
