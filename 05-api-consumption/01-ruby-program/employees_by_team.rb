require "json"
require "rest-client"

puts "What is the team of the employees you're looking for? (e.g. UI / UX)"
team = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for the employees..."

# TODO: your code goes here

url = "https://team-building-api.cleverapps.io/v2/teams"
response = RestClient.get(url, params: {"search" => team})

puts features_collection = JSON.parse(response.body)

puts team_id = features_collection["teams"][0]["id"]


url = "https://team-building-api.cleverapps.io/v2/employees?team_id=2"
response = RestClient.get(url, params: {"team_id" => team_id})

puts features_collection = JSON.parse(response.body)
employees = features_collection["employees"]


employees.each do |employee|
  team = employee["team"]
  team_name = team["name"]
  site = employee["site"]
  site_name = site["name"]
  puts "#{employee["first_name"]} #{employee["last_name"]} (#{employee["job_title"]})"
  puts "from team #{team_name}"
  puts "working from #{site_name}"
  puts
end
