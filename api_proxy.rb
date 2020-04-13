require 'faraday'
require 'json'

module API
  
  URL = ENV["BUZZ_URL"]

  def API.get_all_messages(url)
    response = Faraday.get(url)
  end

  def API.post_message(url, msg)
    Faraday.post(url, msg)
  end

end
