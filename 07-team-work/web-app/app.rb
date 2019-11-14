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

  if params["category"] && !params["category"].empty?
    api_params["category"] = params["category"]
  end
  @city = params["location"]
  @category = params["category"]

  response   = RestClient.get(url, params: api_params)
  payload    = JSON.parse(response.body)

  @activities = payload["activities"]

  url_general = "http://localhost:4567/v2/activities"
  response_general = RestClient.get(url_general)
  response_general_parsed = JSON.parse(response_general)

  cities = []
  categories = []
  response_general_parsed["activities"].each do |activity_general|
    cities = cities << activity_general["city"]
    categories = categories << activity_general["category"]
  end
  @cities_filtered = cities.uniq
  @categories_filtered = categories.uniq

  erb :index
end

get "/activities/:id" do
  id       = params["id"]
  url      = "http://localhost:4567/v2/activities/#{id}"
  response = RestClient.get(url)
  payload  = JSON.parse(response.body)

  @activity = payload["activity"]

  erb :show
end
