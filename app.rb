require 'sinatra'
require 'sinatra/contrib'
require "sinatra/reloader" if development?


# create our first route
get "/cars" do
  "Display all cars"
end

get "/cars/new" do
  "Return a HTML form for creating a new car"
end

post "/cars" do
  "Adding a new car"
end

get "/cars/:id" do
  id = params[:id]
  "Display specific car #{id}"
end

get "/cars/:id/edit" do
  id = params[:id]
  "Return a HTML form for editing a car #{id}"
end

put "/cars/:id" do
  id = params[:id]
  "Updata a specific car #{id}"
end

delete "/cars/:id" do
  id = params[:id]
  "Delete specific car #{id}"
end
