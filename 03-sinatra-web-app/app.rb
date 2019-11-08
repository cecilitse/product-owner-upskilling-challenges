require "sinatra"
require "sinatra/link_header"
require "json"
require "rest-client"
require "sinatra/reloader" if development?

enable :static

get "/" do
  tennis = {
    "id" => 1,
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
    "id" => 2,
    "name" => "Cinema",
    "category" => "Entertainment",
    "city" => "Grand Rex",
    "duration" => 120,
    "participants_count" => 15,
    "price_eur" => 6,
    "picture_url" => "https://img.maximummedia.ie/joe_ie/eyJkYXRhIjoie1widXJsXCI6XCJodHRwOlxcXC9cXFwvbWVkaWEtam9lLm1heGltdW1tZWRpYS5pZS5zMy5hbWF6b25hd3MuY29tXFxcL3dwLWNvbnRlbnRcXFwvdXBsb2Fkc1xcXC8yMDE5XFxcLzAzXFxcLzA2MTYxNTM3XFxcL2NpbmVtYS5qcGdcIixcIndpZHRoXCI6NzY3LFwiaGVpZ2h0XCI6NDMxLFwiZGVmYXVsdFwiOlwiaHR0cHM6XFxcL1xcXC93d3cuam9lLmllXFxcL2Fzc2V0c1xcXC9pbWFnZXNcXFwvam9lXFxcL25vLWltYWdlLnBuZz9pZD0yNjRhMmRiZTM3MGYyYzY3NWZjZFwiLFwib3B0aW9uc1wiOltdfSIsImhhc2giOiJlMzcwOWQ4ZDA4ZDg4MWZmMmMyZjBkYzk3NmFiZTAzNmJjMGNiYTNlIn0=/cinema.jpg",
    "description" => "Allez voir un film à la cool. Le choix de celui-ci sera déterminé à l'avance, par l'ensemble des participants. Sinon, vous pouvez toujours tirer au sort le film et prier pour ne pas tomber sur un navet."
  }
  escape_game = {
    "id" => 3,
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

get "/activity/:id" do
  url_long_text = "https://baconipsum.com/api/?type=meat-and-filler&paras=2"
  response_long_text = RestClient.get(url_long_text)
  long_text = JSON.parse(response_long_text.body)
  @long_text_1 = long_text[0]
  @long_text_2 = long_text[1]

  url_short_text = "https://api.kanye.rest/?format=text"
  response_short_text = RestClient.get(url_short_text)
  @short_text = response_short_text

  token = "048897f9918dda0120bedd713adeaea4"

  tennis = {
    "id" => 1,
    "name" => "Tennis",
    "category" => "Sport",
    "city" => "Chouzy-Sur-Cisse",
    "location" => "Chouzy-Sur-Cisse",
    "duration" => 60,
    "participants_count" => 2,
    "price_eur" => 23,
    "picture_url" => "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS0JC5iIK2BthBrpCm0cL7onqOIzfweWlGr_d813Z9d2Wh99fI8",
    "description" => "Participez à un magnifique tournoi de tennis avec vos collègues. Dominez-les à coups de petite balle jaune. Faîtes les rougir de honte et demandez une augmentation à votre boss."
  }
  cinema = {
    "id" => 2,
    "name" => "Cinema",
    "category" => "Entertainment",
    "city" => "Grand Rex",
    "location" => "Paris",
    "duration" => 120,
    "participants_count" => 15,
    "price_eur" => 6,
    "picture_url" => "https://img.maximummedia.ie/joe_ie/eyJkYXRhIjoie1widXJsXCI6XCJodHRwOlxcXC9cXFwvbWVkaWEtam9lLm1heGltdW1tZWRpYS5pZS5zMy5hbWF6b25hd3MuY29tXFxcL3dwLWNvbnRlbnRcXFwvdXBsb2Fkc1xcXC8yMDE5XFxcLzAzXFxcLzA2MTYxNTM3XFxcL2NpbmVtYS5qcGdcIixcIndpZHRoXCI6NzY3LFwiaGVpZ2h0XCI6NDMxLFwiZGVmYXVsdFwiOlwiaHR0cHM6XFxcL1xcXC93d3cuam9lLmllXFxcL2Fzc2V0c1xcXC9pbWFnZXNcXFwvam9lXFxcL25vLWltYWdlLnBuZz9pZD0yNjRhMmRiZTM3MGYyYzY3NWZjZFwiLFwib3B0aW9uc1wiOltdfSIsImhhc2giOiJlMzcwOWQ4ZDA4ZDg4MWZmMmMyZjBkYzk3NmFiZTAzNmJjMGNiYTNlIn0=/cinema.jpg",
    "description" => "Allez voir un film à la cool. Le choix de celui-ci sera déterminé à l'avance, par l'ensemble des participants. Sinon, vous pouvez toujours tirer au sort le film et prier pour ne pas tomber sur un navet."
  }
  escape_game = {
    "id" => 3,
    "name" => "Escape Game",
    "category" => "Brain",
    "city" => "Corvisart",
    "location" => "Paris",
    "duration" => 90,
    "participants_count" => 8,
    "price_eur" => 70,
    "picture_url" => "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSIkj-IWv-JP22lT3E4dqmXz-GNONnb6loxB0M-qS2JidJsa212",
    "description" => "Enfermez-vous avec les collègues que vous aimez le moins, détestez-les autour d'un jeu où le but est de montrer sa supériorité intellectuelle. Vous n'y arriverez peut-être pas mais ce n'est pas grave : c'est à votre manager de faire l'effort."
  }
  activities = [
    tennis,
    cinema,
    escape_game
  ]
    activities.each do |activity|
      if activity["id"] == params[:id].to_i
        @activity = activity
      end
    end
  location = @activity["location"]
  url_meteo = "https://api.openweathermap.org/data/2.5/weather?q=#{location},fr&appid=#{token}"
  response_meteo = RestClient.get(url_meteo)
  meteo_json = JSON.parse(response_meteo)
  @weather = meteo_json["weather"][0]["main"]
  @temp = (meteo_json["main"]["temp"] - 273.15).round(1)
  @id = params[:id].to_i
  erb :activity
end
