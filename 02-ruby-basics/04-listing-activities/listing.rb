#Create the activity list
activities = [
              {
                "name" => "Giant Cluedo",
                "category" => "Cooperation",
                "city" => "Marseille",
                "duration" => 120,
                "participants" => 30,
                "price" => 200
                },
              {
                "name" => "Surf",
                "category" => "Sport",
                "city" => "Hossegor",
                "duration" => 180,
                "participants" => 20,
                "price" => 250
                },
              {
                "name" => "Hockey",
                "category" => "Sport",
                "city" => "Paris",
                "duration" => 90,
                "participants" => 20,
                "price" => 150
                },
              ]

#Display the information about each activity
activities.each do |activity|
  puts ""
  puts "#{activity["name"]} [#{activity["category"]}]"
  puts "Located in #{activity["city"]}"
  puts "Duration of #{activity["duration"]} minutes"
  puts "For #{activity["participants"]} participants"
  puts "Charged #{activity["price"]} euros"
  puts "---"
end
