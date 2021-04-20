require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [
    # TODO: gather a few activities
  ]

  erb :index
end

get "/components" do
  erb :components
end
