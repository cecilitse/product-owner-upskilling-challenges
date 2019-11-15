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
      query =
      <<~SQL
      SELECT *
      FROM activities
      ORDER BY name
      SQL
    else
      query = "SELECT * FROM activities WHERE #{conditions.join(" AND ")} ORDER BY name"
    end
    activities = DB.execute(query, filters)
    all_sites = DB.execute("SELECT * FROM sites")
    all_favorites = DB.execute("SELECT * FROM site_favorite_activities")
    # site_favorites_by_activity = {}
    site_favorites_by_activity = Hash.new { |hash, key| hash[key] = [] }
    all_favorites.each do |one_favorite|
      activity_id = one_favorite["activity_id"]
      site_id     = one_favorite["site_id"]
      # site_favorites_by_activity[activity_id] ||= []
      site_favorites_by_activity[activity_id] << site_id
    end
    activities.each do |activity|
      favorite_site_ids = site_favorites_by_activity[activity["id"]] || []
        all_sites.each do |site|
          site_favorite = {
            "id"       => site["id"],
            "name"     => site["name"],
            "isFavorite" => favorite_site_ids.include?(site["id"])
          }
          activity["site_favorites"] ||= []
          activity["site_favorites"] << site_favorite
        end
     end
    json "activities" => activities
  end

  get "/activities/:id" do
    id         = params["id"].to_i
    activities = DB.execute("SELECT * FROM activities WHERE id = ?", id)
    activity   = activities.first

    sites_favorited = DB.execute("SELECT s.id as id, s.name as name FROM sites as s JOIN site_favorite_activities as sfa ON sfa.site_id = s.id WHERE sfa.activity_id = ?", id)
    sites = DB.execute("SELECT id,name FROM sites;")

    sites.each do |site|
      if sites_favorited.any? {|site_favorited| site["id"] == site_favorited["id"] }
        site["isFavorite"] = true
      else
        site["isFavorite"] =false
      end
    end
    activity["sites"] = sites
    json "activity" => activity
  end

  get "/sites" do
    sites = DB.execute("SELECT * FROM sites")
    json "sites" => sites
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

namespace "/services" do
  before do
    request.body.rewind
    @request_payload = JSON.parse(request.body.read)
    end

  post "/favorite-deletion" do
    sites = DB.execute("DELETE FROM site_favorite_activities WHERE activity_id=#{@request_payload["activity_id"]} AND site_id=#{@request_payload["site_id"]};")
    status 204
  end
  post "/favorite-addition" do
    sites = DB.execute("INSERT INTO site_favorite_activities (site_id, activity_id) VALUES (#{@request_payload["site_id"]}, #{@request_payload["activity_id"]});")
    status 201
  end
end
