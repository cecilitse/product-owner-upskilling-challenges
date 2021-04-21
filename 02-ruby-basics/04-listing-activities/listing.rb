activities = [
  # TODO: gather at least 3 activities
  {
    "name" => "Escape Game",
    "category" => "Adventure",
    "city" => "Nantes",
    "duration" => 60,
    "number of participants" => 4,
    "price" => 125
  },
  {
    "name" => "Escape Game 2",
    "category" => "Adventure",
    "city" => "Paris",
    "duration" => 60,
    "number of participants" => 4,
    "price" => 200
  },
  {
    "name" => "Escape Game 3",
    "category" => "Adventure",
    "city" => "Marseille",
    "duration" => 60,
    "number of participants" => 4,
    "price" => 170
  }
]

activities.each do |activity|
  puts "#{activity["name"]} [#{activity["category"].upcase}]"
  puts "Located in #{activity["city"]}"
  puts "Duration of #{activity["duration"]} minutes"
  puts "For #{activity["number of participants"]} participants"
  puts "Charged #{activity["price"]}€"
  puts "---"
end
