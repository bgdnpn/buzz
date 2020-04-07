require "sinatra"

Tilt.register Tilt::ERBTemplate, 'erb.html'

get "/" do
  erb :index
end

# get the management page
get "/manage" do
  erb :manage
end

# create new message
post "/manage" do
  nil
end

# get about page
get "/about" do
  erb :about
end

# get a dummy JSON, but valid response
get "/json" do
  content_type 'application/json'
  get_file
end

# mock data store
def get_file(filename="resources/simple-buzz-sample.json")
  File.read(filename)
end
