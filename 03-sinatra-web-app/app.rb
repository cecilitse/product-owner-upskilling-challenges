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
    "img" => "https://cdn.website-editor.net/4a7d6960d9b248328a840828d29c3951/dms3rep/multi/mobile/Survival+immersion+Pascal+immersion.jpg"},
    {"name" => "Mixology",
    "category" => "Workshop",
    "city" => "Paris",
    "duration" => 120,
    "number_of_participants" => 12,
    "price" => 200,
    "img" => "https://images.unsplash.com/photo-1509669803555-fd5edd8d5a41?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"},
    {"name" => "Visit of Marseilles",
    "category" => "Adventure",
    "city" => "Marseilles",
    "duration" => 360,
    "number_of_participants" => 20,
    "price" => 50,
    "img" => "https://www.telegraph.co.uk/content/dam/Travel/Destinations/Europe/France/Marseille/marseille-lead-image-guide.jpg?imwidth=450"},
    {"name" => "Escape game",
    "category" => "Adventure",
    "city" => "Paris",
    "duration" => 240,
    "number_of_participants" => 6,
    "price" => 180,
    "img" => "https://images.unsplash.com/photo-1508345228704-935cc84bf5e2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"},
    {"name" => "Lego Serious Game",
    "category" => "Workshop",
    "city" => "Nantes",
    "duration" => 120,
    "number_of_participants" => 12,
    "price" => 250,
    "img" => "https://images.unsplash.com/photo-1516981879613-9f5da904015f?ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80"},
]

  erb :index
end

get "/activity/1" do
  @activity = {"name" => "Visit of Nantes",
    "category" => "Visits",
    "city" => "Nantes",
    "duration" => 120,
    "number_of_participants" => 10,
    "price" => 100,
    "img" => "https://images.unsplash.com/photo-1548412576-d92cb3275e23?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1053&q=80"}

    erb :activity
end
