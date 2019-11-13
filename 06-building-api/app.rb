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
    activities = DB.execute("SELECT * FROM activities order by name;")

    json "activities" => activities
  end

  get "/activities/:activity_id" do
    activity = DB.execute("SELECT * FROM activities where id = #{params["activity_id"].to_i};")

    json "activity" => activity
  end

end

namespace "/v2" do
  get "/activities" do
    parameters = ""

p params

      params.each_with_index do |(key, value), index|
        if value && value != ""
          if index == 0
            parameters = "WHERE "
          else
            parameters << "AND "
          end

          case key

          when "search"
            parameters << "name like '%#{value.downcase}%' "

          when "city"
            parameters << "lower(city) = '#{value.downcase}' "

          when "category"
            parameters << "lower(category) = '#{value.downcase}' "

          end
        end
      end

        p parameters

    activities = DB.execute("SELECT * FROM activities #{parameters} order by name;")

    json "activities" => activities

  end

  get "/activities/:activity_id" do
    activity = DB.execute("SELECT * FROM activities where id = #{params["activity_id"].to_i};")

    json "activity" => activity.first
  end

  get "/categories" do
    categories = DB.execute("SELECT distinct category as name FROM activities order by name;")

    # categories.find().to_a.each do |cat|
    #   cat["name"] = cat.delete "category"
    # end

    json "categories" => categories

  end

  get "/cities" do
    cities = DB.execute("SELECT distinct city as name FROM activities order by name;")

    json "cities" => cities

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
