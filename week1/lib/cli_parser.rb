class CliParser
  def self.parse_options(argv)
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