require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  activities_url = "https://team-building-api.cleverapps.io/v2/activities"
  response = RestClient.get(activities_url, params: { "city" => params["location"]})
  activities_collection = JSON.parse(response.body)
  @activities = activities_collection["activities"]

  erb :index
end

get "/activities/:id" do
  activity_url = "https://team-building-api.cleverapps.io/v2/activities/#{params["id"]}"
  response = RestClient.get(activity_url)
  @activity = JSON.parse(response.body)["activity"]

  erb :index_activity
end

get "/components" do
  erb :components
end
