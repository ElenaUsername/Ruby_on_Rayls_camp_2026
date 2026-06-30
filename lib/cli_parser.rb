# frozen_string_literal: true

class CliParser
  def self.parse_options(argv)
    command_show_or_search = argv.shift
    keyord_of_show_or_search = argv.shift

    options = {
      command_show_or_search: command_show_or_search,
      keyord_of_show_or_search: keyord_of_show_or_search
    }

    parser = OptionParser.new do |opts|
      opts.banner = 'The options for this parser are:'

      opts.on('--licence = licence_name', 'Print the search result based on the licence') do |licence_name|
        options[:licence] = licence_name
      end
      opts.on('--most-downloads-first', 'Print the search result based on the most downloads') do
        options[:downloads] = true
      end
    end

    begin
      parser.parse(argv)
    rescue OptionParser::InvalidOption => e
      puts e.message
      puts parser
      options[:error] = e.message
    end
    options
  end
end
