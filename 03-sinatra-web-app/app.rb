require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  tennis = {
    "name" => "Tennis",
    "category" => "Sport",
    "city" => "Chouzy-Sur-Cisse",
    "duration" => 60,
    "participants_count" => 2,
    "price_eur" => 23,
    "picture_url" => "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS0JC5iIK2BthBrpCm0cL7onqOIzfweWlGr_d813Z9d2Wh99fI8",
    "description" => "Participez à un magnifique tournoi de tennis avec vos collègues. Dominez-les à coups de petite balle jaune. Faîtes les rougir de honte et demandez une augmentation à votre boss."
  }
  cinema = {
    "name" => "Cinema",
    "category" => "Entertainment",
    "city" => "Grand Rex",
    "duration" => 120,
    "participants_count" => 15,
    "price_eur" => 6,
    "picture_url" => "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT_RJAhoBeC-PXRQgWOdfdd-CeNLm9-2GtwhKPDP-tTuIbe_-mP",
    "description" => "Allez voir un film à la cool. Le choix de celui-ci sera déterminé à l'avance, par l'ensemble des participants. Sinon, vous pouvez toujours tirer au sort le film et prier pour ne pas tomber sur un navet."
  }
  escape_game = {
    "name" => "Escape Game",
    "category" => "Brain",
    "city" => "Corvisart",
    "duration" => 90,
    "participants_count" => 8,
    "price_eur" => 70,
    "picture_url" => "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSIkj-IWv-JP22lT3E4dqmXz-GNONnb6loxB0M-qS2JidJsa212",
    "description" => "Enfermez-vous avec les collègues que vous aimez le moins, détestez-les autour d'un jeu où le but est de montrer sa supériorité intellectuelle. Vous n'y arriverez peut-être pas mais ce n'est pas grave : c'est à votre manager de faire l'effort."
  }
  @activities = [
    tennis,
    cinema,
    escape_game
  ]
  erb :index
end
