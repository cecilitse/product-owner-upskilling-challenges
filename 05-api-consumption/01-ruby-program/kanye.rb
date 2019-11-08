require "json"
require "rest-client"

# response = RestClient.get("https://api.kanye.rest")
# payload = JSON.parse(response.body)
# quote = payload["quote"]
# puts quote

quote = JSON.parse(RestClient.get("https://api.kanye.rest").body)["quote"]
puts quote
