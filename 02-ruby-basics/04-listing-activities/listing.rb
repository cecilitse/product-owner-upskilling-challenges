tennis = {
  "name" => "Tennis",
  "category" => "Sport",
  "city" => "Chouzy-Sur-Cisse",
  "duration" => 60,
  "participants_count" => 2,
  "price_eur" => 23.50
}
cinema = {
  "name" => "Cinema",
  "category" => "Entertainment",
  "city" => "Grand Rex",
  "duration" => 120,
  "participants_count" => 15,
  "price_eur" => 6.79
}
escape_game = {
  "name" => "Escape Game",
  "category" => "Brain",
  "city" => "Corvisart",
  "duration" => 90,
  "participants_count" => 8,
  "price_eur" => 70
}


activities = [
tennis,
cinema,
escape_game
]

puts "Here are many activities you can do : \n \n"
activities.each_with_index do |activity, index|
  puts "Activité #{index +1} :"
  puts "#{activity["name"]} [#{activity["category"].upcase}] \n"
  puts "Located in #{activity["city"]}"
  puts "Duration of #{activity["duration"]} minutes"
  puts "For #{activity["participants_count"]} participants"
  puts "Charged #{activity["price_eur"]}€"
  puts "---"
end
