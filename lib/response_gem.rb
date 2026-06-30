# frozen_string_literal: true

require 'faraday'
require 'json'

class ResponseGem
  def self.verify_response_invalid(response)
    if response.status != 200
      puts "Error: #{response.status} - #{response.reason_phrase}\n Please check the gem name and try again."
      return 1
      exit 1
    end
    0
  end

  def self.Fetch_url_response(url, api_key)
    response = Faraday.get(url) do |req|
      req.headers['Authorization'] = "Bearer #{api_key}"
    end

    return 1 if ResponseGem.verify_response_invalid(response) == 1

    response
  end
end
