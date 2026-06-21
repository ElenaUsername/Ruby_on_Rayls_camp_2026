require './lib/ruby_gem_options'


RSpec.describe "RubyGemOptions" do
  context "Method show_gem_info"do
    it "Show description of a gem" do
      # expect(RubyGemOptions.show_gem_info("rails")[:error_code]).to eq 0
      expect(RubyGemOptions.show_gem_info("rails")[:info]).to eq "Ruby on Rails is a full-stack web framework optimized for programmer happiness and sustainable productivity. It encourages beautiful code by favoring convention over configuration."
    end
    # it "Show return 0 when gem not found" do
    #   expect(RubyGemOptions.show_gem_info("railggg")).to eq 1
    # end
  end

  context "Method search_gem_info" do
    it "Show description of a gem" do
      expect(RubyGemOptions.show_gem_info("rails")[:error_code]).to eq 0
      # expect(RubyGemOptions.search_gem_info("rails")[:name]).to eq "Ruby on Rails is a full-stack web framework optimized for programmer happiness and sustainable productivity. It encourages beautiful code by favoring convention over configuration."
    end
  end

  
end
