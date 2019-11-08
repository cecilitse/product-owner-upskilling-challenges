require "json"
require "rest-client"

puts "What is the role of the users you're looking for? (e.g. Figgo - Manager)"
role = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for the users..."

access_token = "18afcfb8-697b-4742-b726-418269485cee"
url_roles = "https://wagon.ilucca-demo.net/api/v3/roles"

role_params = {"name" => "#{role}", "fields" => "name, id"}
response = RestClient.get(url_roles, "params" => role_params, "Authorization" => "Lucca application=#{access_token}")
role = JSON.parse(response.body)
role_details = role["data"]["items"][0]
role_id = role_details["id"]

url_users = "https://wagon.ilucca-demo.net/api/v3/users"
user_params = {"roleprincipalid" => "#{role_id}", "fields" => "name, jobtitle"}
response = RestClient.get(url_users, "params" => user_params, "Authorization" => "Lucca application=#{access_token}")
users = JSON.parse(response.body)
users_details = users["data"]["items"]
number_of_users = users_details.size
puts "Total : #{number_of_users} people found"
users_details.each do |user|
  puts user["name"]
  puts "---"
  puts user["jobTitle"]
end
