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
    body = request.body.read
    params.merge!(JSON.parse(body))
  end
end

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
    # [POSSIBLE QUERIES]
    # 1. SELECT * FROM activities ORDER BY name
    # 2. SELECT * FROM activities WHERE lower(name) LIKE "%Escape Game%" ORDER BY name
    # 3. SELECT * FROM activities WHERE city = "Nantes" ORDER BY name
    # 4. SELECT * FROM activities WHERE category = "Adventure" ORDER BY name
    # 5. SELECT * FROM activities WHERE lower(name) LIKE "%Escape Game%" AND city = "Nantes" AND category = "Adventure" ORDER BY name

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

  get "/employees" do
    conditions = []
    filters    = {}

    if params["first_name"] && !params["first_name"].empty?
      conditions << "first_name = :first_name"
      filters["first_name"] = params["first_name"]
    end

    if params["last_name"] && !params["last_name"].empty?
      conditions << "last_name = :last_name"
      filters["last_name"] = params["last_name"]
    end

    if params["site_id"] && !params["site_id"].empty?
      conditions << "site_id = :site_id"
      filters["site_id"] = params["site_id"]
    end

    if params["team_id"] && !params["team_id"].empty?
      conditions << "team_id = :team_id"
      filters["team_id"] = params["team_id"]
    end

    query = <<~SQL
      SELECT employees.*, sites.name AS site_name, teams.name AS team_name
      FROM employees
      INNER JOIN teams ON teams.id = employees.team_id
      INNER JOIN sites ON sites.id = employees.site_id
    SQL

    if filters.any?
      query << " WHERE #{conditions.join(" AND ")}"
    end

    query << " LIMIT 35"

    employees = DB.execute(query, filters)

    employees.each do |employee|
      site_id   = employee.delete("site_id")
      site_name = employee.delete("site_name")

      team_id   = employee.delete("team_id")
      team_name = employee.delete("team_name")

      employee["site"] = { "id" => site_id, "name" => site_name }
      employee["team"] = { "id" => team_id, "name" => team_name }
    end

    json "employees" => employees
  end

  get "/sites" do
    conditions = []
    filters    = {}

    if params["search"] && !params["search"].empty?
      conditions << <<~SQL
        (
             lower(name)     LIKE :search
          OR lower(address)  LIKE :search
          OR lower(zip_code) LIKE :search
          OR lower(city)     LIKE :search
        )
      SQL

      filters["search"] = "%#{params["search"]}%".downcase
    end

    if filters.empty?
      query = "SELECT * FROM sites ORDER BY name"
    else
      query = "SELECT * FROM sites WHERE #{conditions.join(" AND ")} ORDER BY name"
    end

    sites = DB.execute(query, filters)

    json "sites" => sites
  end

  get "/teams" do
    conditions = []
    filters    = {}

    if params["search"] && !params["search"].empty?
      conditions << "lower(name) LIKE :search"
      filters["search"] = "%#{params["search"]}%".downcase
    end

    if filters.empty?
      query = "SELECT * FROM teams ORDER BY name"
    else
      query = "SELECT * FROM teams WHERE #{conditions.join(" AND ")} ORDER BY name"
    end

    teams = DB.execute(query, filters)

    json "teams" => teams
  end

  get "/favorites" do

    activity_id         = params["activity_id"].to_i
    favorites = DB.execute("SELECT * FROM site_favorite_activities WHERE activity_id = ?", activity_id)

    json "favorites" => favorites
  end

  post "/favorites" do

    activity_id         = params["activity_id"].to_i
    site_id         = params["site_id"].to_i
    DB.execute("INSERT INTO site_favorite_activities (activity_id, site_id) VALUES (#{activity_id}, #{site_id})")

  end

  delete "/favorites" do

    id         = params["id"].to_i
    DB.execute("DELETE FROM site_favorite_activities where id=?", id)

  end

  get "/reviews" do
    activity_id         = params["activity_id"].to_i
    reviews = DB.execute("SELECT * FROM reviews WHERE activity_id = ?", activity_id)
    json "reviews" => reviews
  end

  post "/reviews" do
    activity_id         = params["activity_id"].to_i
    owner_name          = params["owner_name"]
    comment             = params["comment"]
    evaluation          = params["evaluation"].to_i
    date                = params["date"]
    DB.execute("INSERT INTO reviews (activity_id, owner_name, comment, evaluation, date) VALUES (#{activity_id}, \"#{owner_name}\", \"#{comment}\", #{evaluation}, \"#{date}\")")
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

    get "/employees" do
      erb :"doc/v2/employees"
    end

    get "/sites" do
      erb :"doc/v2/sites"
    end

    get "/teams" do
      erb :"doc/v2/teams"
    end
  end
end
