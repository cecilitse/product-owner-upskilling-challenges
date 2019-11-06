activity = {
  "Name" => "Escape Game",
  "Category" => "Adventure",
  "City" => "Limoges",
  "Duration" => 60,
  "Number of participants" => 6,
  "Price" => 15
  }

  puts "#{activity["Name"]} [#{activity["Category"]}]"
  puts "Located in #{activity["City"]}"
  puts "Duration of #{activity["Duration"]} minutes"
  puts "For #{activity["Number of participants"]} participants"
  puts "Charged #{activity["Price"]*activity["Number of participants"]}€"
