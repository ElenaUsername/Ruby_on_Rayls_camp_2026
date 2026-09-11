# frozen_string_literal: true

require 'uri'
require 'optparse'

require_relative './lib/ruby_gem_options'
require_relative './lib/cli_parser'

options = CliParser.parse_options(ARGV)

if options[:error]
  exit 1
end

command = options[:command]
keyword = options[:keyword]

if command == 'show'
  puts("***SHOW***\n")
  RubyGemOptions.show_gem_info(keyword)
elsif command == 'search'
  puts("***SEARCH***\n")
  data = RubyGemOptions.search_gem_info(keyword)

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
