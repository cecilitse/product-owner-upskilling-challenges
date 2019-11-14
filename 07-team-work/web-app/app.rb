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

  url_long_text = "https://baconipsum.com/api/?type=meat-and-filler&paras=2"
  response_long_text = RestClient.get(url_long_text)
  long_text = JSON.parse(response_long_text.body)
  @long_text_1 = long_text[0]
  @long_text_2 = long_text[1]

  url_short_text = "https://api.kanye.rest/?format=text"
  response_short_text = RestClient.get(url_short_text)
  @short_text = response_short_text

  token = "048897f9918dda0120bedd713adeaea4"
  location = @activity["city"]
  url_meteo = "https://api.openweathermap.org/data/2.5/weather?q=#{location},fr&appid=#{token}"

  response_meteo = RestClient.get(url_meteo)
  meteo_json = JSON.parse(response_meteo)
  @weather = meteo_json["weather"][0]["main"]
  @temp = (meteo_json["main"]["temp"] - 273.15).round(1)

  erb :show
end
