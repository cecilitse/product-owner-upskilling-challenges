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
    activities = DB.execute("select * from activities order by activities.name;")
    json "activities" => activities
  end
  get "/activities/:id" do
    activity = DB.execute("select * from activities where id = #{params["id"]}").first
    json "activity" => activity
  end
end


namespace "/v2" do
  get "/activities" do
    conditions=[]
    city=params["city"]
    category=params["category"]
    search=params["search"]
    if city != nil
      conditions << "city = '#{city}'"
    end
    if category != nil
      conditions << "category = '#{category}'"
    end
    if search != nil
      conditions << "name like '%#{search}%'"
    end

    if conditions!= []
      activities = DB.execute("select * from activities where #{conditions.join(" AND ")} order by activities.name;")
    else
      activities = DB.execute("select * from activities order by activities.name;")
    end

    json "activities" => activities
  end

  get "/activities/:id" do
    activity = DB.execute("select * from activities where id = #{params["id"]}").first
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
