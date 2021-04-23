require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  activities_url = "https://team-building-api.cleverapps.io/v2/activities"
  response = RestClient.get(activities_url,params: {"city" => params["location"]})
  payload = JSON.parse(response.body)
  @activities = payload["activities"]


  erb :index
end

get "/activities/:id" do
  id= params["id"]
  activity_url = "https://team-building-api.cleverapps.io/v2/activities/#{id}"
  response = RestClient.get(activity_url)
  payload = JSON.parse(response.body)
  @activity = payload["activity"]

  erb :show
end

get "/components" do
  erb :components
end
