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
  @channels = ["#random", "#fun_at_work", "#general", "#product", "#runners", "#dev", "#support"]
  erb :messages
end

# create new message
post "/messages" do
  body = {message: params["message"]}
  API.post_message(API::URL, body)
  redirect "/messages"
end

# get about page
get "/about" do
  erb :about
end
