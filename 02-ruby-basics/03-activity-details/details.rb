activity = {
  "name" => "Tennis",
  "category" => "Sport",
  "city" => "Chouzy-Sur-Cisse",
  "duration" => 60,
  "participants_count" => 2,
  "price_eur" => 23.50
}

puts "#{activity["name"]} [#{activity["category"].upcase}] \n"
puts "Located in #{activity["city"]}"
puts "Duration of #{activity["duration"]} minutes"
puts "For #{activity["participants_count"]} participants"
puts "Charged #{activity["price_eur"]}€"
