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
    activities = DB.execute("SELECT * FROM activities ORDER BY activities.name ASC;")

    json "activities" => activities
  end

  get "/activities/:id" do
    activities = DB.execute("SELECT * FROM activities WHERE activities.id = #{params["id"]};")

    json "activities" => activities
  end
end

namespace "/v2" do
  # get "/activities" do
  #   activities = DB.execute("SELECT * FROM activities ORDER BY activities.name ASC;")

  #   json "activities" => activities
  # end

  get "/activities" do

    # if params["city"] && params["category"]
    #   activities = DB.execute("SELECT * FROM activities WHERE activities.city = '#{params["city"]}' AND activities.category = '#{params["category"]}' ORDER BY activities.name ASC;")
    # elsif params["city"] && params["search"]
    #   activities = DB.execute("SELECT * FROM activities WHERE activities.city = '#{params["city"]}' AND activities.name LIKE '%#{params["search"]}%' ORDER BY activities.name ASC;")
    filters = []

    if params["city"]
      filters << "city = '#{params["city"]}'"
    end
    if params["category"]
      filters << "category = '#{params["category"]}'"
    end
    if params["search"]
      filters << "name LIKE '%#{params["search"]}%'"
    end

    if filters.empty?
      activities = DB.execute("SELECT * FROM activities ORDER BY activities.name ASC;")
    else
      activities = DB.execute("SELECT * FROM activities WHERE #{filters.join(" AND ")} ORDER BY activities.name ASC;")
    end

    json "activities" => activities
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
