require './lib/cli_parser'

RSpec.describe CliParser do
  context "Parsing show option" do
    it "Should return the show option with the gem name" do
      expect(described_class.parse_options(["--show", "rails"])).to eq({:show=>"rails"})
    end
  end

  context "Parsing search option" do
    it "Should return the search option with the keyword" do
      expect(described_class.parse_options(["--search","rails"])).to eq({:search=>"rails"})
    end
  end

  context "Parsing help option" do
    it "returns the help option" do
      expect(described_class.parse_options(['--opt_help'])).to eq({:opt_help=>true})
    end
  end
end