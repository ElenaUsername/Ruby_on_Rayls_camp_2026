require 'uri'
require 'optparse'

require_relative './lib/ruby_gem_options'
require_relative './lib/cli_parser'

if ARGV[0] == "--show"
    puts("***SHOW***\n")
    RubyGemOptions.show_gem_info(ARGV[1])
elsif ARGV[0] == "--search"
    puts("***SEARCH***\n")
    data = RubyGemOptions.search_gem_info(ARGV[1])
    options = CliParser.parse_options(ARGV)

    if options[:licence]
        data = RubyGemOptions.filter_information_by_licence(data, options[:licence])
    elsif options[:downloads]
        data = RubyGemOptions.filter_information_by_downloads(data)
    end

    GetPrintInfo.print_name_info_list(data)


else
    puts("***WARNING***\nNo Valid option was provided, please try again.")
    exit 1
end
    