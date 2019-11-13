require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  url = "https://team-building-api.cleverapps.io/v2/activities"
  # url = "https://team-building-api.cleverapps.io/v2/activities?city=#{params["location"]}"
  response = RestClient.get(url)
  all_activities = JSON.parse(response.body)["activities"]
  @cities = []
  all_activities.each do |activity|
    @cities << activity["city"]
  end
  @cities.uniq!

  @location = params["location"]

  response = RestClient.get(url, "params" => {"city" => @location })
  @activities = JSON.parse(response.body)["activities"]

  erb :index
end

get "/activities/:id" do
  url = "https://team-building-api.cleverapps.io/v2/activities/#{params["id"]}"
  response = RestClient.get(url)
  @activity = JSON.parse(response.body)["activity"]

  erb :activity
end
