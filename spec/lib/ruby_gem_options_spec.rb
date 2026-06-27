require './lib/ruby_gem_options'

RSpec.describe "RubyGemOptions" do
  context "Method show_gem_info" do
    it "Description of a gem" do
      expect { RubyGemOptions.show_gem_info("rails") }.to output(/rails/).to_stdout
    end
    it "Expect error when gem does not exist" do
      expect(RubyGemOptions.show_gem_info("railssss")).to eq 1
    end
  end

  context "Method search_gem_info" do
    it "The search result should contain the introduced" do
      expect { RubyGemOptions.search_gem_info("rails") }.to output(/rails/).to_stdout
    end
    it "Expect error when gem does not exist" do
      expect(RubyGemOptions.search_gem_info("railssss")).to eq 1
    end
  end
end
