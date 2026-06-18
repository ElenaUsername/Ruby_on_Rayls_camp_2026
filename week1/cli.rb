require 'uri'
require 'optparse'

require_relative 'gem'

# Create a parser with three option
# -se --search  for the keyword in gem list
# -sh --show    the information of the gem
# -h --help    message

# Precondition:
# Verify that there are 2 aguments provided
# Only help can be used alone
# gem install faraday

# Search option: 
# the user should provide a keyword to search for gems
# the program should return a list of gems that match the keyword

# Show option: 
# the user should provide a gem name to show the information of the gem
# verify that the gem name is valid and exists in the gem list

# Help option:
# display a help message if the user provides invalid arguments or options
# and if the user introduce the -h or --help option

#working code for testing the methods that where created in Gem.rb
# show_gem_info(ARGV[1]) do |gem_name|
#     print "Fetching information for gem: #{gem_name}..."
# end
# search_gem_info(ARGV[1]) do |keyword|
#     print "Searching for gems with keyword: #{keyword}..."
# end

options = {}

parser = OptionParser.new do |opts|
    opts.banner = "The options for this parser are:"

    # Show option
    opts.on("--show = NAME", "Show for gem information by introducing the gem name") do |name|
        options[:show] = name
    end
    # Search option
    opts.on("--search = KEYWORD", "Search for the gems that contain the keyword") do |keyword|
        options[:search] = keyword
    end
    # Help option
    opts.on("-h, --help","Display the help message") do
        options[:help] = true
        puts parser
        parse.exit
    end
end

begin 
    parser.parse(ARGV)
rescue OptionParser::InvalidOption => e
    puts e.message
    puts parser
    exit 1
end

if options[:show]
    puts("***SHOW***\n")
    show_gem_info(options[:show])
elsif options[:search]
    puts("***SEARCH***\n")
    search_gem_info(options[:search])
elsif options[:help]
    puts("***HELP***\n")
    puts parser
    exit 0
else
    puts("***WARNING***\nNo Valid option was provided, please try again.")
    puts parser
    exit 1
end
    