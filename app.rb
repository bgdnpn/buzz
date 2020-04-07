require "sinatra"

Tilt.register Tilt::ERBTemplate, 'erb.html'

get "/" do
  erb :index
end

get "/json" do
  content_type 'application/json'
  get_file
end

def get_file(filename="simple-buzz-sample.json")
  File.read(filename)
end
