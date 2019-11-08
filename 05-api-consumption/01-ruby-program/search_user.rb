require "json"
require "rest-client"

access_token = "18afcfb8-697b-4742-b726-418269485cee"

# Demande du nom
puts "What is the name of the user you're looking for? (e.g. Bob Dylan)"
name = gets.chomp
puts "Ok got it! Let's search for that person..."


#Obtention de l'id du nom
url_id = "https://wagon.ilucca-demo.net/api/v3/users/find?clue=#{name}&fields=id"

response_id = RestClient.get(url_id, "Authorization" => "Lucca application=#{access_token}")
user_id = JSON.parse(response_id.body)

userid=user_id["data"]["items"][0]["id"]

# Obtention des caractéristiques de la personne

url_user = "https://wagon.ilucca-demo.net/api/v3/users/#{userid}?fields=firstName,lastName,mail,jobTitle,department"

response_user = RestClient.get(url_user, "Authorization" => "Lucca application=#{access_token}")
user_detail = JSON.parse(response_user.body)
user_firstName = user_detail["data"]["firstName"]
user_lastName = user_detail["data"]["lastName"]
user_mail = user_detail["data"]["mail"]
user_jobTitle = user_detail["data"]["jobTitle"]
user_departement = user_detail["data"]["department"]["name"]

puts "#{user_firstName} #{user_lastName} (#{user_mail})"
puts "#{user_jobTitle}"
puts "From department of #{user_departement}"
