require 'faraday'
require 'json'

require 'response_gem'

class RubyGemOptions
  
  def self.show_gem_info(gem_name)
      #Get the information of one gem based on the gem_name
      url = "https://rubygems.org/api/v1/gems/#{gem_name}.json"
      response = Faraday.get(url)

      if  ResponseGem.verify_response(response) == 1
        return(1)
      end

      data = JSON.parse(response.body)
    
      result = {
        name: data['name'],
        info: data['info'],
        error_code: 0
      }

      puts "Fetching information for gem: #{gem_name}..."
      puts "Name: #{data['name']} \nInfo: #{data['info']}"
      return result
    end

  def self.search_gem_info(keyword)
      #Get the gem list based on the keyword
      url = "https://rubygems.org/api/v1/search.json?query=#{keyword}"
      response = Faraday.get(url)

      if  ResponseGem.verify_response(response) == 1
        return(1)
      end

      data = JSON.parse(response.body)

      data.map do |gem|
        {
          name: gem['name'],
          info: gem['info']
        }
      end
      puts "Searching for gems with keyword: #{keyword}..."
      data.each do |gem|
        puts "Name: #{gem['name']} \nInfo: #{gem['info']}"
        return(result)
      end
    end
end