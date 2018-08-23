# Before you can create your seven restful routes you have to link your ruby file to a sinatra server
require 'sinatra'
require 'sinatra/contrib'
# This part of the code allows you to develop the code and see changes in a broswer or an app 'Postman'. It will also be changed from development to deployed once you are happy with the end product
require "sinatra/reloader" if development?
# This would be the root of a local server. There can only be one root.
get "/" do
  "Root Page"
end
# Resources can reprsent a group of data witin a domain. Which can be viewed from the perspective of a user. In this example I use movies.
# In this example I used movies and the first url that is generated would reflect all the movies that exist or an offer within that domain.
# The first restful routing = Action "Index" | HTTP Method "get". It uses the get HTTP method to acquire all data which has movies in it. Since it is the parent resource, it will get all movies
get "/movies" do
  "Display all movies"
end

# The second restful routing = Action "New" | HTTP Method "get". This uses the get HTTP method to acquire a form to add new data to the parent resource. In this case it would be used to add a new movie release.
get "/movies/new" do
  "Return a HTML form for adding a new Movie to the group of data"
end
# The third restful routing = Action "Create" | HTTP Method "Post". This uses the post HTTP method to directly add new data into the database. So rather than request for new data to be put in, it would directly add new data in to the current database
post "/movies" do
  "Adds a new movie to the database"
end
# The fourth restful routing = Action "Show" | HTTP Method "get". This uses the get HTTP method to show specific data within a parent resource. So in this case I would be able to display a specific move "Lord of the Rings the Fellowship of the Ring". This move would have its own id so that it can be called by attaching the id to the end of the url
get "/movies/:id" do
  id = params[:id]
  "Display specific movie depending on the id '#{id}'"
end
# The fifth restful routing = Action "Edit" | HTTP Method "get". This uses the get HTTP method would request a form to request an edit for an exisiting data type. So in this case if "Lord of the Rings the Fellowship of the Ring" had incorrect detail you can request a form to edit it
get "/movies/:id/edit" do
  id = params[:id]
  "Return a HTML form for editing a specific movie by accessing it through that specific id'#{id}''"
end
# The sixth restful routing = Action "Update" | HTTP Method "put". This uses the put HTTP method to update/change existing data within the parent resource. So if you wanted to add more data or update something within the data you would use this.
put "/movies/:id" do
  id = params[:id]
  "Updates the specific movie using its specific '#{id}'"
end
# The seventh restful routing = Action "Destroy" | HTTP Method "delete". This uses the destroy HTTP method to delete existing data. So if you have noticed you have made a mistake when adding data you can delete that data and the create a new. Or if say you were running a website that sold items and an item had stopped being manufacture you could delete it.
delete "/movies/:id" do
  id = params[:id]
  "Deletes the specific movie using its specific '#{id}'  '"
end
