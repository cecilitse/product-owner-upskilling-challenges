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
    city=params["city"]
    category=params["category"]
    search=params["search"]
    if city
    activities = DB.execute("select * from activities where city=\"#{city}\" order by name;")
    elsif category
    activities = DB.execute("select * from activities where category=\"#{category}\" order by name;")
    elsif search
    activities = DB.execute("select * from activities where name like \"%#{search}%\" order by name;")
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
