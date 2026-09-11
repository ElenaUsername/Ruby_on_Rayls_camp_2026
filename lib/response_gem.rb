# frozen_string_literal: true

require 'faraday'
require 'json'
require 'dotenv/load'

class ResponseGem
  API_KEY = ENV['RUBYGEMS_API_KEY']

  def self.verify_response_invalid(response)
    if response.status != 200
      puts "Error: #{response.status} - #{response.reason_phrase}\n Please check the gem name and try again."
      return 1
    end
    0
  end

  def self.fetch_url_response(url)
    response = Faraday.get(url) do |req|
      req.headers['Authorization'] = "Bearer #{API_KEY}"
    end

    return 1 if ResponseGem.verify_response_invalid(response) == 1

    response
  end
end
