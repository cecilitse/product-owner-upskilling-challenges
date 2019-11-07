require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [
    {"name" => "Visit of Nantes",
    "category" => "Visits",
    "city" => "Nantes",
    "duration" => 120,
    "number_of_participants" => 10,
    "price" => 100,
    "img" => "https://images.unsplash.com/photo-1548412576-d92cb3275e23?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80"},
    {"name" => "Survival workshop",
    "category" => "Adventure",
    "city" => "Rambouillet",
    "duration" => 240,
    "number_of_participants" => 8,
    "price" => 500,
    "img" => "https://images.unsplash.com/photo-1548412576-d92cb3275e23?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80"},
    {"name" => "Mixology",
    "category" => "Workshop",
    "city" => "Paris",
    "duration" => 120,
    "number_of_participants" => 12,
    "price" => 200,
    "img" => "https://images.unsplash.com/photo-1548412576-d92cb3275e23?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80"},
]

  erb :index
end
