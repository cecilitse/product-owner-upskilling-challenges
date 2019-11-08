require "json"
require "rest-client"

puts "What is the name of the user you're looking for? (e.g. Bob Dylan)"
name = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for that person..."

# TODO: your code goes here


authorization = "Lucca user=50847e9a-e8f3-4e7e-8b40-fcf7e4962b42"
url = "https://wagon.ilucca-demo.net/api/v3/users/find?clue=#{name}"
response = RestClient.get(url,  "Authorization" => authorization)

user_id = JSON.parse(response.body)

puts response.code
puts user_id
id = user_id["data"]["items"][0]["id"]

p id

url = "https://wagon.ilucca-demo.net/api/v3/users/#{id}"
response = RestClient.get(url,  "Authorization" => authorization)

user_details = JSON.parse(response.body)
puts user_details
#firstname = user_details["data"]["items"][0]["id"]

#Lilly Evans (levans@example.org)
#Business Developer
#From department of Sales
