require 'faraday'
require 'json'
require 'dotenv/load'
require 'lightly'

require_relative 'response_gem'
require_relative 'get_print_info'

class RubyGemOptions
  @api_key = ENV['RUBYGEMS_API_KEY']
  @cache = Lightly.new(life: 172_800, dir: 'tmp/cache')
  
  def self.show_gem_info(gem_name)
      response = ResponseGem.Fetch_url_response("https://rubygems.org/api/v1/gems/#{gem_name}.json", @api_key)
      return 1 if response == 1
      data = JSON.parse(response.body)
      GetPrintInfo.print_name_info(data)
      return data['info']
    end

  def self.search_gem_info(keyword)
    cached_data = @cache.get("search_#{keyword}") do
      response = ResponseGem.Fetch_url_response("https://rubygems.org/api/v1/search.json?query=#{keyword}", @api_key)
      return 1 if response == 1
      response.body
    end

    return 1 if cached_data == 1
    data = JSON.parse(cached_data)
    return 1 if data.empty?
    
    # if !filter_information_by_arg.nil?
    #   RubyGemOptions.filter_information_by(data, filter_information_by_arg, license_name)
    # end

    GetPrintInfo.print_name_info_list(data)
    return data

  end

 
  def self.filter_information_by_licence(data, license_name)
      return 1 if !license_name.nil?
        
      data = data.select do |gem| 
        gem['licenses'] && gem['licenses'].map(&:upcase).include?(options[license_name].upcase)
      end
      return data
  end

  def self.filter_information_by_downloads(data)
        
      data =data.sort { |a, b| b[:downloads] <=> a[:downloads] }
      return data
  end

  
end