require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [
    {
      "name" => "Escape Game",
      "category" => "Adventure",
      "city" => "Nantes",
      "duration" => 60,
      "number of participants" => 4,
      "price" => 125
    },
    {
      "name" => "Escape Game 2",
      "category" => "Adventure",
      "city" => "Paris",
      "duration" => 60,
      "number of participants" => 4,
      "price" => 200
    },
    {
      "name" => "Escape Game 3",
      "category" => "Adventure",
      "city" => "Marseille",
      "duration" => 60,
      "number of participants" => 4,
      "price" => 170
    }
  ]

  erb :index
end

get "/components" do
  erb :components
end
