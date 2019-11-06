activities = [
  {"name" => "Visit of Nantes",
  "category" => "Visits",
  "city" => "Nantes",
  "duration" => 120,
  "number_of_participants" => 10,
  "price" => 100},
  {"name" => "Survival workshop",
  "category" => "Adventure",
  "city" => "Rambouillet",
  "duration" => 240,
  "number_of_participants" => 8,
  "price" => 500},
  {"name" => "Mixology",
  "category" => "Workshop",
  "city" => "Paris",
  "duration" => 120,
  "number_of_participants" => 12,
  "price" => 200},
]

# TODO: your code goes here

activities.each do |activity|
  puts "#{activity["name"]} [#{activity["category"].upcase}]"
  puts "Located in #{activity["city"]}"
  puts "Duration of #{activity["duration"]} minutes"
  puts "For #{activity["number_of_participants"]} participants"
  puts "Charged #{activity["price"]}€"
  puts "---"
end
