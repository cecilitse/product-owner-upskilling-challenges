require "json"
require "rest-client"
access_token = "18afcfb8-697b-4742-b726-418269485cee"

puts "What is the role of the users you're looking for? (e.g. Figgo - Manager)"
role = gets.chomp # asks user to type something in the Terminal
puts "Ok got it! Let's search for the users..."

# Recherche du role id
url_roles = "https://wagon.ilucca-demo.net/api/v3/roles?name=#{role}"

response_role = RestClient.get(url_roles, "Authorization" => "Lucca application=#{access_token}")

response_parsed = JSON.parse(response_role)
role_id = response_parsed["data"]["items"][0]["id"]

# Recuperation des infos du role saisi

url_role = "https://wagon.ilucca-demo.net/api/v3/users?rolePrincipalId=#{role_id}&fields=firstName,lastName,jobTitle"

response_user = RestClient.get(url_role, "Authorization" => "Lucca application=#{access_token}")
response_user_parsed = JSON.parse(response_user.body)

users_details = response_user_parsed["data"]["items"]
puts "Total: #{users_details.size} people found"
users_details.each do |hash|
  puts  "#{hash["firstName"]} #{hash["lastName"]}"
  puts hash["jobTitle"]
  puts "---"
end
