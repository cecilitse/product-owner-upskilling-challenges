require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do

url = "https://team-building-api.cleverapps.io/v2/activities"
city = params["location"]
response = RestClient.get(url,"params" => {"city" => city})

parsed_response = JSON.parse(response.body)
@activities = parsed_response["activities"]


  erb :index
end

get "/activities/:id" do

  @id=params[:id]
  url = "https://team-building-api.cleverapps.io/v2/activities/#{@id}"
  response = RestClient.get(url)

  @activity = JSON.parse(response.body)

  @name = @activity["activity"]["name"]
  @category = @activity["activity"]["category"]
  @duration = @activity["activity"]["duration"]
  @price = @activity["activity"]["price"]
  @city = @activity["activity"]["city"]
  @participants = @activity["activity"]["participants_count"]
  @photo_url = @activity["activity"]["photo_url"]

  erb :details
end
