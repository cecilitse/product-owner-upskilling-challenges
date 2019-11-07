require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [{ "name" => "Farniente",
    "category" => "Relaxing",
    "city" => "at the beach",
    "duration" => 600,
    "participants" => 6,
    "price" => 0,
    "image" => "https://www.ithaka.travel/blog/wp-content/uploads/2017/09/Featured-Image-8.jpg"
  },
  { "name" => "Cocktail",
    "category" => "Relaxing",
    "city" => "at the beach",
    "duration" => 60,
    "participants" => 6,
    "price" => 600,
    "image" => "https://www.ithaka.travel/blog/wp-content/uploads/2017/09/Featured-Image-8.jpg"
  },
  { "name" => "Swimming",
    "category" => "Sport",
    "city" => "at the beach",
    "duration" => 60,
    "participants" => 6,
    "price" => 0,
    "image" => "https://www.ithaka.travel/blog/wp-content/uploads/2017/09/Featured-Image-8.jpg"
  }]

  erb :index
end
