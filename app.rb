require "sinatra"
require "json"
require "./api_proxy.rb"

Tilt.register Tilt::ERBTemplate, 'erb.html'

get "/" do
  erb :index
end

# get the management page
get "/messages" do
  @messages = JSON.parse(API.get_all_messages(API::URL).body)
  p @messages
  erb :messages
end

# create new message
post "/messages" do
  body = "{'message': %s}" % params["message"]
  content_type "application/json"
  API.post_message(API::URL, body)
  redirect "/messages"
end

# get about page
get "/about" do
  erb :about
end
