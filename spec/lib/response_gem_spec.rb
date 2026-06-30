# frozen_string_literal: true

require './lib/response_gem'

RSpec.describe 'ResponseGem' do
  context 'Verify response invalid' do
    it 'Should return 0 if the url is valid' do
      expect(ResponseGem.verify_response_invalid(Faraday.get('https://rubygems.org/api/v1/gems/rails.json'))).to eq 0
    end
    it 'Should return 1 if the url is invalid' do
      expect(ResponseGem.verify_response_invalid(Faraday.get('https://rubygems.org/api/v1/gems/railsss.json'))).to eq 1
    end
  end
end
