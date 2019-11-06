activities = [{ "name" => "Farniente",
  "category" => "Relaxing",
  "city" => "at the beach",
  "duration" => 600,
  "participants" => 6,
  "price" => 0
},
{ "name" => "Cocktail",
  "category" => "Relaxing",
  "city" => "at the beach",
  "duration" => 60,
  "participants" => 6,
  "price" => 600
},
{ "name" => "Swimming",
  "category" => "Sport",
  "city" => "at the beach",
  "duration" => 60,
  "participants" => 6,
  "price" => 0
}]

activities.each do |activity|
  puts "#{activity["name"]} [#{activity["category"]}]
Located #{activity["city"]}
Duration of #{activity["duration"]} minutes
For #{activity["participants"]} participants
Charged #{activity["price"]}€"
end
