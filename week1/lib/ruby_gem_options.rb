require 'faraday'
require 'json'

require 'response_gem'
require 'get_print_info'

class RubyGemOptions
  
  def self.show_gem_info(gem_name)
      response = ResponseGem.Fetch_url_response("https://rubygems.org/api/v1/gems/#{gem_name}.json")
      return 1 if response == 1
      data = JSON.parse(response.body)
      GetPrintInfo.print_name_info(data)
      return data['info']
    end

  def self.search_gem_info(keyword)
      response = ResponseGem.Fetch_url_response("https://rubygems.org/api/v1/search.json?query=#{keyword}")
      return 1 if response == 1
      data = JSON.parse(response.body)
      return 1 if data.empty?
      GetPrintInfo.print_name_info_list(data)
      return data
    end
end