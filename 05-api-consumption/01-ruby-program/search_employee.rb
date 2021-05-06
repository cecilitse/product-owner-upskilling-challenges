require "json"
require "rest-client"

puts "What is the name of the employee you're looking for? (e.g. Bob Dylan)"
name = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for that person..."

# TODO: your code goes here
name = name.split
url = "https://team-building-api.cleverapps.io/v2/employees"
response = RestClient.get(url, params: {"first_name" => name[0],"last_name" => name[1]})

features_collection = JSON.parse(response.body)

employees = features_collection["employees"]
team = employees[0]["team"]
team_name = team["name"]
site = employees[0]["site"]
site_name = site["name"]

puts "#{employees[0]["first_name"]} #{employees[0]["last_name"]} (#{employees[0]["job_title"]})"
puts "from team #{team_name}"
puts "working from #{site_name}"
