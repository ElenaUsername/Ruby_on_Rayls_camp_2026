require 'faraday'
require 'json'

def show_gem_info(gem_name)
    #Get the information of one gem based on the gem_name
    url = "https://rubygems.org/api/v1/gems/#{gem_name}.json"
    response = Faraday.get(url)

    if response.status != 200
        puts "Error: #{response.status} - #{response.reason_phrase}\n Please check the gem name and try again."
        exit 1
    end

    data = JSON.parse(response.body)
  
    {
      name: data['name'],
      info: data['info']
    }

    puts "Fetching information for gem: #{gem_name}..."
    puts "Name: #{data['name']} \nInfo: #{data['info']}"
  end

def search_gem_info(keyword)
    #Get the gem list based on the keyword
    url = "https://rubygems.org/api/v1/search.json?query=#{keyword}"
    response = Faraday.get(url)
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
    end
  end

# show_gem_info(ARGV[1]) do |gem_name|
#     print "Fetching information for gem: #{gem_name}..."
# end
# search_gem_info(ARGV[1]) do |keyword|
#     print "Searching for gems with keyword: #{keyword}..."
# end