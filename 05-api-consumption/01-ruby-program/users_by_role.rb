require "json"
require "rest-client"

puts "What is the role of the users you're looking for? (e.g. Figgo - Manager)"
role = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for the users..."

# Role as a variable for testing
# role = "Figgo - Manager"

# TODO: your code goes here
url_roles = "https://wagon.ilucca-demo.net/api/v3/roles"
url_users = "https://wagon.ilucca-demo.net/api/v3/users"

token = "18afcfb8-697b-4742-b726-418269485cee"

# Role query parameters
params_roles = {
  "name" => "like,#{role}",
  "fields" => "id, name"
}

# Role query
response = RestClient.get(url_roles, "params" => params_roles, "Authorization" => "Lucca application=#{token}" )

payload = JSON.parse(response.body)

role_id = payload["data"]["items"][0]["id"]

# User query parameters
params_users = {
  "rolePrincipal.id" => "#{role_id}",
  "fields" => "name, jobTitle"
}

# User query
response_users = RestClient.get(url_users, "params" => params_users, "Authorization" => "Lucca application=#{token}" )

payload_users = JSON.parse(response_users.body)

users = payload_users["data"]["items"]

# Loop on user display
users.each do |user|
  puts "#{user["name"]}"
  puts "#{user["jobTitle"]}"
  puts "---"
end
