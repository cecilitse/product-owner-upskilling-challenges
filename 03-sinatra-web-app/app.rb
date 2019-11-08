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
    "image" => "https://images.unsplash.com/photo-1556463208-f8c2505e8299"
  },
  { "name" => "Snorkeling",
    "category" => "Sport",
    "city" => "at the beach",
    "duration" => 60,
    "participants" => 6,
    "price" => 300,
    "image" => "https://images.unsplash.com/photo-1543037855-00580e109d39"
  }]

  erb :index
end
get "/activities/1" do
  @activity = { "name" => "Farniente",
    "category" => "Relaxing",
    "city" => "at the beach",
    "duration" => 600,
    "participants" => 6,
    "price" => 0,
    "image" => "https://www.ithaka.travel/blog/wp-content/uploads/2017/09/Featured-Image-8.jpg"
  }
  erb :activity
end
get "/activitii/1" do
  @activity = { "name" => "Farniente",
    "category" => "Relaxing",
    "city" => "at the beach",
    "duration" => 600,
    "participants" => 6,
    "price" => 0,
    "image" => "https://www.ithaka.travel/blog/wp-content/uploads/2017/09/Featured-Image-8.jpg"
  }
  erb :activitii
end
