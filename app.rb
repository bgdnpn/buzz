require "sinatra"
require "json"

Tilt.register Tilt::ERBTemplate, 'erb.html'

get "/" do
  erb :index
end

# get the management page
get "/messages" do
  @messages = read_yaml_data
  erb :messages
end

# create new message
post "/messages" do
  params.to_json
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
