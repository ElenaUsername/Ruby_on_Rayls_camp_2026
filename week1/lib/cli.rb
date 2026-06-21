require 'uri'
require 'optparse'

require_relative 'ruby_gem_options'

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
    RubyGemOptions.show_gem_info(options[:show])
elsif options[:search]
    puts("***SEARCH***\n")
    RubyGemOptions.search_gem_info(options[:search])
elsif options[:help]
    puts("***HELP***\n")
    puts parser
    exit 0
else
    puts("***WARNING***\nNo Valid option was provided, please try again.")
    puts parser
    exit 1
end
    