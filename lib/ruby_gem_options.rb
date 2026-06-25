require 'faraday'
require 'json'
require 'dotenv/load'

require_relative 'response_gem'
require_relative 'get_print_info'

class RubyGemOptions
  @api_key = ENV['RUBYGEMS_API_KEY']
  
  def self.show_gem_info(gem_name)
      response = ResponseGem.Fetch_url_response("https://rubygems.org/api/v1/gems/#{gem_name}.json", @api_key)
      return 1 if response == 1
      data = JSON.parse(response.body)
      GetPrintInfo.print_name_info(data)
      return data['info']
    end

  def self.search_gem_info(keyword)
      response = ResponseGem.Fetch_url_response("https://rubygems.org/api/v1/search.json?query=#{keyword}", @api_key)
      return 1 if response == 1
      data = JSON.parse(response.body)
      return 1 if data.empty?
      GetPrintInfo.print_name_info_list(data)
      return data
    end
end