require "sinatra"
require "sinatra/json"
require "sinatra/link_header"
require "sinatra/namespace"
require "sinatra/reloader" if development?

require "sqlite3"

enable :static

DB_PATH = File.join(__dir__, "db/team_building.sqlite")
DB      = SQLite3::Database.new(DB_PATH)
DB.results_as_hash = true

get "/" do
  json "name" => "Team Building API", "status" => "Running"
end

namespace "/v1" do
  get "/activities" do
    activities = DB.execute("SELECT * FROM activities;")
    json "activities" => activities
  end
  get "/activities/:id" do
    activity = DB.execute("SELECT * FROM activities WHERE id=#{params["id"]};")
    json "activities" => activity
  end
end

namespace "/v2" do
  get "/activities" do
    parameters = []
    if params["city"] != nil && params["city"].empty? == false
      parameters << "city='#{params["city"]}'"
    end
    if params["category"] != nil && params["category"].empty? == false
      parameters << "category='#{params["category"]}'"
    end
    if params["search"] != nil && params["search"] == false
      parameters << "LOWER(name) LIKE '%#{params["search"].downcase}%'"
    end

    parameters_size = parameters.size
    if parameters.empty?
      activities = DB.execute("SELECT * FROM activities")
    elsif parameters_size == 1
      activities = DB.execute("SELECT * FROM activities WHERE #{parameters[0]}")
    elsif parameters_size == 2
      activities = DB.execute("SELECT * FROM activities WHERE #{parameters[0]} AND #{parameters[1]}")
    elsif parameters_size == 3
      activities = DB.execute("SELECT * FROM activities WHERE #{parameters[0]} AND #{parameters[1]} AND #{parameters[2]}")
    end
    json "activities" => activities
  end

  get "/activities/:id" do
    activity = DB.execute("SELECT * FROM activities WHERE id=#{params["id"].to_i};")
    json "activity" => activity[0]
  end
  get "/cities" do
    cities_origin = DB.execute("SELECT DISTINCT city FROM activities;")
    cities = []
    cities_origin.each do |city|
      city_hash = {"name" => city["city"]}
      cities << city_hash
    end
    json "cities" => cities
  end
  get "/categories" do
    categories = DB.execute("SELECT DISTINCT category AS name FROM activities;")
    json "categories" => categories
  end
end


namespace "/doc" do
  get { erb :"doc/index" }

  namespace "/v1" do
    get "/activities" do
      erb :"doc/v1/activities"
    end
  end

  namespace "/v2" do
    get "/activities" do
      erb :"doc/v2/activities"
    end
  end
end
