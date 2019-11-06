activity = {
  "name" => "Tennis",
  "category" => "Sport",
  "city" => "Chouzy-Sur-Cisse",
  "duration" => 60,
  "participants_count" => 2,
  "price_eur" => 23.50
}

activity_message = "#{activity["name"]} [#{activity["category"].upcase}]
Located in #{activity["city"]}
Duration of #{activity["duration"]} minutes
For #{activity["participants_count"]} participants
Charged #{activity["price_eur"]}€ per person; which makes #{activity["price_eur"]*activity["participants_count"]}€ in total"

puts activity_message
