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
    activities = DB.execute("SELECT * FROM activities ORDER BY name")
    json "activities" => activities
  end

  get "/activities/:id" do
    id         = params["id"].to_i
    activities = DB.execute("SELECT * FROM activities WHERE id = ?", id)
    activity   = activities.first

    json "activity" => activity
  end
end

namespace "/v2" do
  get "/activities" do

    conditions = []
    filters    = {}

    if params["search"] && !params["search"].empty?
      conditions << "lower(name) LIKE :search"
      filters["search"] = "%#{params["search"]}%".downcase
    end

    if params["category"] && !params["category"].empty?
      conditions << "category = :category"
      filters["category"] = params["category"]
    end

    if params["city"] && !params["city"].empty?
      conditions << "city = :city"
      filters["city"] = params["city"]
    end

    if filters.empty?
      query = "SELECT * FROM activities ORDER BY name"
    else
      query = "SELECT * FROM activities WHERE #{conditions.join(" AND ")} ORDER BY name"
    end

    activities = DB.execute(query, filters)

    json "activities" => activities
  end

  get "/activities/:id" do
    id         = params["id"].to_i
    activities = DB.execute("SELECT * FROM activities WHERE id = ?", id)
    activity   = activities.first

    json "activity" => activity
  end

  get "/teams" do
    teams = DB.execute("SELECT * FROM teams ORDER BY name")
    json "teams" => teams
  end

  get "/wishes" do

    conditions = []
    filters    = {}

    if params["team_id"] && !params["team_id"].empty?
      conditions << "team_id = :team_id"
      filters["team_id"] = params["team_id"]
    end

    if params["activity_id"] && !params["activity_id"].empty?
      conditions << "activity_id = :activity_id"
      filters["activity_id"] = params["activity_id"]
    end

    if filters.empty?
      query = "SELECT * FROM team_favorite_activities"
    else
      query = "SELECT * FROM team_favorite_activities WHERE #{conditions.join(" AND ")}"
    end

    wishes = DB.execute(query, filters)

    json "wishes" => wishes
  end

  get "/wishes/:id" do
    id     = params["id"].to_i
    wishes = DB.execute("SELECT * FROM team_favorite_activities WHERE id = ?", id)
    wish   = wishes.first

    json "wish" => wish
  end

  post "/wishes" do
    team_id = params["team_id"].to_i
    activity_id = params["activity_id"].to_i
    wishes = DB.execute("SELECT * FROM team_favorite_activities WHERE team_id = #{team_id} AND activity_id = #{activity_id}")

    if wishes == []
      DB.execute("INSERT INTO team_favorite_activities (team_id, activity_id) VALUES (#{team_id}, #{activity_id})")
      new_wish = DB.execute("SELECT * FROM team_favorite_activities WHERE id = ?", DB.last_insert_row_id)
      status 201
      json "wish" => new_wish
    else
      status 204
    end

  end

  delete "/wishes/:id" do
    DB.execute("DELETE FROM team_favorite_activities WHERE id = #{params["id"]}")
    status 204
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

  namespace "/v2" do
    get "/wishes" do
      erb :"doc/v2/wishes"
    end
  end

  namespace "/v2" do
    get "/teams" do
      erb :"doc/v2/teams"
    end
  end
end
