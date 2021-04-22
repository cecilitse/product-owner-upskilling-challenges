require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [
      {
        "name" => "Giant Cluedo",
        "category" => "Cooperation",
        "city" => "Marseille",
        "duration" => 120,
        "participants" => 30,
        "price" => 200
        },
      {
        "name" => "Surf",
        "category" => "Sport",
        "city" => "Hossegor",
        "duration" => 180,
        "participants" => 20,
        "price" => 250
        },
      {
        "name" => "Hockey",
        "category" => "Sport",
        "city" => "Paris",
        "duration" => 90,
        "participants" => 20,
        "price" => 150
        },
  ]

  erb :index
end

get "/components" do
  erb :components
end
