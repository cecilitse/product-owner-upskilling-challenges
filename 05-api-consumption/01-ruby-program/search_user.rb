require "json"
require "rest-client"

puts "What is the name of the user you're looking for? (e.g. Bob Dylan)"
name1 = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for that person..."

access_token = "18afcfb8-697b-4742-b726-418269485cee"
url = "https://wagon.ilucca-demo.net/api/v3/users"
user_params = {"name" => "like,#{name1}", "fields" => "name, mail, jobtitle, department"}
response = RestClient.get(url, "params" => user_params, "Authorization" => "Lucca application=#{access_token}")
user = JSON.parse(response.body)
user_details = user["data"]["items"][0]
puts "#{user_details["name"]} (#{user_details["mail"]})"
puts user_details["jobTitle"]
puts "From department of #{user_details["department"]["name"]}"
