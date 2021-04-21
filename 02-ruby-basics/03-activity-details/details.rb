activity = {
            "name" => "Giant Cluedo",
            "category" => "Cooperation",
            "city" => "Marseille",
            "duration" => 120,
            "participants" => 30,
            "price" => 200
}

#Display the information about the activity

puts "#{activity["name"]} [#{activity["category"]}]"
puts "Located in #{activity["city"]}"
puts "Duration of #{activity["duration"]} minutes"
puts "For #{activity["participants"]} participants"
puts "Charged #{activity["price"]} euros"
