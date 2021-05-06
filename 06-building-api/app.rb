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

before do
  if request.get_header("CONTENT_TYPE") == "application/json"
    params.merge!(JSON.parse(request.body.read))
  end
end

get "/" do
  json "name" => "Team Building API", "status" => "Running"
end

namespace "/v1" do
  get "/activities" do
    activities = DB.execute("SELECT * FROM activities ORDER BY activities.name ASC;")
    json "activities" => activities
  end

  get "/activities/:id" do
    activity = DB.execute("SELECT * FROM activities WHERE id = #{params["id"]};").first
    json "activity" => activity
  end
end

namespace "/v2" do
  get "/activities" do
    city = params["city"]
    category = params["category"]
    search  = params["search"]

    array = []

    if city != nil
      array <<"city = '#{city}'"
    end

    if category != nil
      array <<"category = '#{category}'"
    end

    if search != nil
      array <<"name like '%#{search}%'"
    end

    conditions = array.join(" and ")

    if array.empty?
      activities = DB.execute("SELECT * FROM activities ORDER BY name ASC;")
    else
      activities = DB.execute("SELECT * FROM activities WHERE #{conditions} ORDER BY name ASC;")
    end
    #activities = DB.execute("SELECT * FROM activities WHERE city = '#{city}' and category = '#{category}' and name LIKE '%#{search}%' ORDER BY name ASC;")
    json "activities" => activities
  end

  get "/activities/:id" do
    activity = DB.execute("SELECT * FROM activities WHERE id = #{params["id"]};").first
    json "activity" => activity
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
