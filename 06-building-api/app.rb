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
     activities_req_answer = DB.execute("SELECT * FROM activities;")

     json "activities" => activities_req_answer

  end

  get "/activities/:id" do
    activity_req_answer = DB.execute("SELECT * FROM activities WHERE activities.id = #{params["id"]} ")

    json "activity ID=#{params["id"]}" => activity_req_answer

  end

end

namespace "/v2" do

  get "/activities" do
    p params
    if params.empty?
      activities_req_answer = DB.execute("SELECT * FROM activities")

    elsif params["city"] != nil && params["category"] == nil && params["search"] == nil
      activities_req_answer = DB.execute("SELECT * FROM activities WHERE activities.city = '#{params["city"]}'")

    elsif params["city"] != nil && params["category"] != nil && params["search"] == nil
      activities_req_answer = DB.execute(
        <<~SQL
          SELECT * FROM activities
          WHERE activities.category = '#{params["category"]}' AND activities.city = '#{params["city"]}'
          ORDER BY activities.name
        SQL
      )

    elsif params["city"] != nil && params["category"] == nil && params["search"] != nil
      activities_req_answer = DB.execute(
        <<~SQL
          SELECT * FROM activities
          WHERE activities.name like '%#{params["search"]}%' AND activities.city = '#{params["city"]}'
          ORDER BY activities.name
        SQL
      )

    elsif params["city"] == nil && params["category"] != nil && params["search"] == nil
      activities_req_answer = DB.execute("SELECT * FROM activities WHERE activities.category = '#{params["category"]}'")

    elsif params["city"] == nil && params["category"] != nil && params["search"] != nil
      activities_req_answer = DB.execute("SELECT * FROM activities WHERE activities.category = '#{params["category"]}'")

    elsif params["city"] == nil && params["category"] == nil && params["search"] != nil
      activities_req_answer = DB.execute("SELECT * FROM activities WHERE activities.name like '%#{params["search"]}%'")

    else
      activities_req_answer = DB.execute(
        <<~SQL
          SELECT * FROM activities
          WHERE activities.category = '#{params["category"]}'
                AND activities.city = '#{params["city"]}'
                AND activities.name like '%#{params["search"]}%'
          ORDER BY activities.name
        SQL
      )


    end


     json "activities" => activities_req_answer

  end

  get "/activities/:id" do
    activity_req_answer = DB.execute("SELECT * FROM activities WHERE activities.id = #{params["id"]} ")
    activity = activity_req_answer.first
    json "activity ID=#{params["id"]}" => activity


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
