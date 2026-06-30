require './lib/cli_parser'
require 'spec_helper'

def test_parse_options(argv, expected_command, expected_keyword, expected_licence, expected_downloads)
  options = CliParser.parse_options(argv)

  expect(options[:command_show_or_search]).to eq(expected_command)
  expect(options[:keyord_of_show_or_search]).to eq(expected_keyword)
  expect(options[:licence]).to eq(expected_licence)
  expect(options[:downloads]).to eq(expected_downloads)
end

RSpec.describe CliParser do
  describe ".parse_options" do
    it "extracts the command and keyword as the first two positional args" do
      test_parse_options(["--show", "rails"], "--show", "rails", nil, nil)
    end

    it "Sets keyword to nil if only the command is given" do
      test_parse_options(["--search"], "--search", nil, nil, nil)
    end

    it "returns nil for both command and keyword when argv is empty" do
      test_parse_options([], nil, nil, nil, nil)
    end

    it "parses the --licence option and stores its value" do
      test_parse_options(["--search", "rails", "--licence", "MIT"], "--search", "rails", "MIT", nil)
    end

    it "parses the --most-downloads-first flag as true" do
      test_parse_options(["--search", "rails", "--most-downloads-first"], "--search", "rails", nil, true)
    end

    it "can combine both options at once" do
      test_parse_options(["--search", "rails", "--licence", "MIT", "--most-downloads-first"], "--search", "rails", "MIT", true)
    end

    it "prints the error message and usage banner when given an invalid option" do
      expect {
        CliParser.parse_options(["--search", "rails", "--bogus-flag"])
      }.to output(/invalid option/i).to_stdout
    end
  end
end