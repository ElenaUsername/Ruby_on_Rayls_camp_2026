require './lib/ruby_gem_options'

def test_for_show(name, result)
  it "Method show_gem_info"
  expect {RubyGemOptions.show_gem_info("name")}.to eq(result)
  end

end

RSpec.describe "RubyGemOptions" do
  context "Method show_gem_info" do
    it "Description of a gem" do
      expect { RubyGemOptions.show_gem_info("rails") }.to output(/rails/).to_stdout
    end
    it "Expect error when gem does not exist" do
      expect(RubyGemOptions.show_gem_info("railsss")).to eq 1
    end
  end

  context "Method search_gem_info" do
    it "The search result should contain the introduced" do
      expect { RubyGemOptions.search_gem_info("rails",nil, nil) }.to output(/rails/).to_stdout
    end
    it "Expect error when gem does not exist" do
      expect(RubyGemOptions.search_gem_info("railsss",nil, nil)).to eq 1
    end
    it "The search result contains the licence a valid one --licence" do
      expect { RubyGemOptions.search_gem_info("rails", "--licence", "MIT") }.to output(/rails/).to_stdout
    end
    it "Expect error when gem does not exist --licence" do
      expect(RubyGemOptions.search_gem_info("railsss", "--licence", "MIT")).to eq 1
    end

    it "The search result contains a filter --most-downloads-first" do
      expect {RubyGemOptions.search_gem_info("rails", "--most-downloads-first")}.to output(/rails/).to_stdout
    end


  end

end
