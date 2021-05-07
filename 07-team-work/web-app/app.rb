require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  url        = "http://localhost:4567/v2/activities"
  api_params = {}

  # filtering
  if params["location"] && !params["location"].empty?
    api_params["city"] = params["location"]
  end

  response   = RestClient.get(url, params: api_params)
  payload    = JSON.parse(response.body)

  @activities = payload["activities"]

  erb :index
end

get "/activities/:id" do
  id       = params["id"]
  url      = "http://localhost:4567/v2/activities/#{id}"
  response = RestClient.get(url)
  payload  = JSON.parse(response.body)

  @activity = payload["activity"]

  # GET sites
  url_sites     = "http://localhost:4567/v2/sites"
  response_sites = RestClient.get(url_sites)
  payload_sites  = JSON.parse(response_sites.body)

  @sites = payload_sites["sites"]

  # GET favorites
  url_favorites     = "http://localhost:4567/v2/favorites"
  response_favorites = RestClient.get(url_favorites, params: {"activity_id" => @activity["id"]})
  payload_favorites  = JSON.parse(response_favorites.body)

  @favorites = payload_favorites["favorites"]
  @site_ids_test=[]
  @favorites.each do |favorite|
    @site_ids_test << favorite["site_id"]
  end

  # GET reviews
  url_reviews     = "http://localhost:4567/v2/reviews"
  response_reviews = RestClient.get(url_reviews, params: {"activity_id" => @activity["id"]})
  payload_reviews  = JSON.parse(response_reviews.body)

  @reviews = payload_reviews["reviews"]


  evaluations=[]
  @reviews.each do |review|
      evaluations<<review["evaluation"]
  end

  sum=0
  nb_evaluation=0

  evaluations.each do |evaluation|
    sum= sum+evaluation
    nb_evaluation= nb_evaluation+1

  end

  if nb_evaluation != 0
    @average = sum/nb_evaluation
  else
    @average= 0
  end
    @empty_stars=5-@average

    p @average
    p @empty_stars

  p @reviews
  erb :show
end

post "/favorites" do
  activity_id = params["activity_id"].to_i
  site_ids = params["site_ids"]
  p params

  #GET
  url_activity_favorites      = "http://localhost:4567/v2/favorites"
  response_activity_favorites = RestClient.get(url_activity_favorites, params: {"activity_id" => activity_id})
  payload_activity_favorites  = JSON.parse(response_activity_favorites.body)

  activity_favorites = payload_activity_favorites["favorites"]
  @site_ids_post=[]
  activity_favorites.each do |favorite|
    @site_ids_post << favorite["site_id"]
  end

  #POST
  sites_to_be_added=[]
  site_ids.each do |site_id|
    next if site_id.empty?

    unless site_ids.include? @site_ids_post
      sites_to_be_added << site_id
    end
  end

  sites_to_be_added.each do |site_id_to_be_added|
    url_post_favorites     = "http://localhost:4567/v2/favorites"
    headers = { content_type: "json" }

    favorites_params = {
        "activity_id" => activity_id,
        "site_id"  => site_id_to_be_added.to_i
    }

    response_post_favorites = RestClient.post(url_post_favorites, favorites_params.to_json, headers)
  end

  #DELETE
  sites_to_be_deleted=[]
  favorites_id_to_be_deleted=[]
  @site_ids_post.each do |site_id|
    if site_ids.include? site_id
    else sites_to_be_deleted << site_id
    end
  end
  activity_favorites.each do |favorite|
    if sites_to_be_deleted.include? favorite["site_id"]
      favorites_id_to_be_deleted << favorite["id"]
    else
    end
  end

  favorites_id_to_be_deleted.each do |favorite_id_to_be_deleted|
    url_delete_favorites     = "http://localhost:4567/v2/favorites"
    headers = { content_type: "json" }

    favorites_params_delete = {
        "id" => favorite_id_to_be_deleted
            }

    response_delete_favorites = RestClient.delete(url_delete_favorites, params: favorites_params_delete)
  end

  redirect to("/activities/#{activity_id}")
end

post "/reviews" do
  p params
  activity_id = params["activity_id"].to_i
  owner_name  = params["owner_name"]
  comment     = params["comment"]
  evaluation  = params["evaluation"].to_i

  url_post_reviews     = "http://localhost:4567/v2/reviews"
  headers = { content_type: "json" }

  reviews_params = {
      "activity_id" => activity_id,
      "owner_name"  => owner_name,
      "comment"     => comment,
      "evaluation"  => evaluation,
  }

  response_post_reviews = RestClient.post(url_post_reviews, reviews_params.to_json, headers)
  redirect to("/activities/#{activity_id}")
end

get "/components" do
  erb :components
end
