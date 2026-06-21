
require 'faraday'
require 'json'

class ResponseGem
  def self.verify_response(response)
    if response.status != 200
          puts "Error: #{response.status} - #{response.reason_phrase}\n Please check the gem name and try again."
          return(1)
          exit 1
    end
    return(0)
  end
end