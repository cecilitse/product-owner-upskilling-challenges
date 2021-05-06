require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  url        = "http://localhost:4567/v2/activities"
  api_params = {}

  # filtering
  if params["location"] && !params["location"].empty?
    api_params["city"] = params["location"]
  end

  response   = RestClient.get(url, params: api_params)
  payload    = JSON.parse(response.body)

  @activities = payload["activities"]

  erb :index
end

get "/activities/:id" do
  id       = params["id"]
  url      = "http://localhost:4567/v2/activities/#{id}"
  response = RestClient.get(url)
  payload  = JSON.parse(response.body)

  @activity = payload["activity"]

  url_teams = "http://localhost:4567/v2/teams"
  response_teams = RestClient.get(url_teams)
  payload_teams = JSON.parse(response_teams.body)

  @teams = payload_teams["teams"]

  url_wishlist = "http://localhost:4567/v2/team_favorite_activities?activity_id=#{id}"
  response_wishlist = RestClient.get(url_wishlist)
  payload_wishlist = JSON.parse(response_wishlist.body)

  team_favorite = payload_wishlist["team_favorite_activities"]

  @wishlist = []

  team_favorite.each do |favorite|
    @wishlist << favorite["team_id"]
  end

  #@wishlist = payload_wishlist["team_favorite_activities"]

  erb :show
end

post "/activities/:activity_id/wishlist/:team_id" do
  activity_id   = params["activity_id"]
  team_id       = params["team_id"]
  url           = "http://localhost:4567/v2/team_favorite_activities"
  headers = {content_type: "json"}

  body          =
  {
    "team_favorite_activities":[
      {
        "team_id" => team_id,
        "activity_id" => activity_id
      }
    ]
  }

  RestClient.post(url, body.to_json, headers)

  redirect to("/activities/#{activity_id}")
end

delete "/activities/:activity_id/wishlist/:team_id" do
  activity_id   = params["activity_id"]
  team_id       = params["team_id"]
  url           = "http://localhost:4567/v2/team_favorite_activities"

  body          =
  {
    "team_favorite_activities":[
      {
        "team_id" => team_id,
        "activity_id" => activity_id
      }
    ]
  }

  RestClient.delete(url, params: body)

  redirect to("/activities/#{activity_id}")
end

get "/components" do
  erb :components
end
