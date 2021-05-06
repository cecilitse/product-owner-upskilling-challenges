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

  url_sites     = "http://localhost:4567/v2/sites"
  response_sites = RestClient.get(url_sites)
  payload_sites  = JSON.parse(response_sites.body)

  @sites = payload_sites["sites"]

  url_favorites     = "http://localhost:4567/v2/favorites"
  response_favorites = RestClient.get(url_favorites)
  payload_favorites  = JSON.parse(response_favorites.body)

  @favorites = payload_favorites["favorites"]

  erb :show
end

post "/favorites" do
  activity_id = params["activity_id"].to_i
  site_ids = params["site_ids"]

  #GET
  url_activity_favorites      = "http://localhost:4567/v2/favorites"
  response_activity_favorites = RestClient.get(url_activity_favorites, params: {"activity_id" => activity_id})
  payload_activity_favorites  = JSON.parse(response_activity_favorites.body)

  @activity_favorites = payload_activity_favorites["favorites"]
  site_ids_test=[]
  @activity_favorites.each do |favorite|
    site_ids_test << favorite["site_id"]
  end

  #POST
  site_ids.each do |site_id|
    url_post_favorites     = "http://localhost:4567/v2/favorites"
    headers = { content_type: "json" }

    favorites_params = {
        "activity_id" => activity_id,
        "site_id"  => site_id.to_i
    }

    response_post_favorites = RestClient.post(url_post_favorites, favorites_params.to_json, headers)
  end
  redirect to("/activities/#{activity_id}")
end

get "/components" do
  erb :components
end
