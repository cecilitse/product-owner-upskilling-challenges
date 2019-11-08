require "json"
require "rest-client"

puts "What is the name of the user you're looking for? (e.g. Bob Dylan)"
name = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for that person..."

# TODO: your code goes here
url = "https://wagon.ilucca-demo.net/api/v3/users"
token = "18afcfb8-697b-4742-b726-418269485cee"
params = {
  "name" => "like,#{name}",
  "fields" => "name, mail, jobTitle, department.name"
}

response = RestClient.get(url, "params" => params, "Authorization" => "Lucca application=#{token}" )

payload = JSON.parse(response.body)

user_name = payload["data"]["items"][0]["name"]
user_email = payload["data"]["items"][0]["mail"]
user_title = payload["data"]["items"][0]["jobTitle"]
user_department = payload["data"]["items"][0]["department"]["name"]

puts "#{user_name} (#{user_email})"
puts user_title
puts "From department #{user_department}"
