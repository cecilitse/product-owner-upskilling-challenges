activities = [
  {
  "Name" => "Escape Game",
  "Category" => "Adventure",
  "City" => "Limoges",
  "Duration" => 60,
  "Number of participants" => 6,
  "Price" => 15
  },
  {
  "Name" => "Museum visit",
  "Category" => "culture",
  "City" => "Paris",
  "Duration" => 120,
  "Number of participants" => 12,
  "Price" => 20
  },
  {
  "Name" => "Cinema",
  "Category" => "Art",
  "City" => "Limoges",
  "Duration" => 110,
  "Number of participants" => 50,
  "Price" => 12
    }
]

activities.each do |activity|
  puts "- #{activity["Name"]} [#{activity["Category"].upcase}]"
  puts "- Located in #{activity["City"]}"
  puts "- Duration of #{activity["Duration"]} minutes"
  puts "- For #{activity["Number of participants"]} participants"
  puts "- Charged #{activity["Price"]*activity["Number of participants"]}€"
  puts"----"
end
