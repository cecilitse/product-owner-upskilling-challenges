require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do

  @activities = [
    {
    "Name" => "Escape Game",
    "Category" => "Adventure",
    "City" => "Limoges",
    "Duration" => 60,
    "Number of participants" => 6,
    "Price" => 15,
    "Picture" => "/images/escape.jpg"
    },
    {
    "Name" => "Museum visit",
    "Category" => "culture",
    "City" => "Paris",
    "Duration" => 120,
    "Number of participants" => 12,
    "Price" => 20,
    "Picture" => "https://www.destinationdijon.com/wp-content/uploads/wpetourisme/Salles-3eme-Renaissance-MdBA-2019-1.jpg"
    },
    {
    "Name" => "Cinema",
    "Category" => "Art",
    "City" => "Limoges",
    "Duration" => 110,
    "Number of participants" => 50,
    "Price" => 12,
    "Picture" => "https://www.loudenvielle.fr/wp-content/uploads/sites/220/2018/07/photo-salle-cinema-arixo-loudenvielle.jpg"
      }
  ]

  erb :index
end

get "/activities/1" do
  @activity = {
    "Name" => "Escape Game",
    "Category" => "Adventure",
    "City" => "Limoges",
    "Duration" => 60,
    "Number of participants" => 6,
    "Price" => 15,
    "Picture" => "/images/escape.jpg"
    }
  erb :details
end
