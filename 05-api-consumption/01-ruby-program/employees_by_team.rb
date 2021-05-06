require "json"
require "rest-client"

puts "What is the team of the employees you're looking for? (e.g. UI / UX)"
team = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for the employees..."

urlidteam = "https://team-building-api.cleverapps.io/v2/teams?search=#{team}"
response = RestClient.get(urlidteam)
teams = JSON.parse(response.body)

team_id = teams["teams"][0]["id"]

urlteam = "https://team-building-api.cleverapps.io/v2/employees?team_id=#{team_id}"
response = RestClient.get(urlteam)
employees = JSON.parse(response.body)

employees2 = employees["employees"]
employees2.each do |employee|
  puts "#{employee["first_name"]} #{employee["last_name"]}"
  puts employee["job_title"]
  puts "---"
end
