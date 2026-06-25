require 'uri'
require 'optparse'

require_relative 'ruby_gem_options'
require_relative 'cli_parser'

options = CliParser.parse_options(ARGV)

if options[:show]
    puts("***SHOW***\n")
    RubyGemOptions.show_gem_info(options[:show])
elsif options[:search]
    puts("***SEARCH***\n")
    RubyGemOptions.search_gem_info(options[:search])
elsif options[:help]
    puts("***HELP***\n")
    puts parser
else
    puts("***WARNING***\nNo Valid option was provided, please try again.")
    puts parser
    exit 1
end
    