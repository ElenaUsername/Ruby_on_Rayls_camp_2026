require './lib/cli_parser'

RSpec.describe "CliParser" do
  context "Parsing show option" do
    it "Should return the show option with the gem name" do
      expect(CliParser.parse_options(["--show", "rails"])).to eq({:show=>"rails"})
    end
  end

  context "Parsing search option" do
    it "Should return the search option with the keyword" do
      expect(CliParser.parse_options(["--search","rails"])).to eq({:search=>"rails"})
    end
  end

  # context "Parsing help option" do
  #   it "Should return the help option" do
  #     expect(CliParser.parse_options(["--help"])).to eq({:help=>true})
  #   end
  # end
end