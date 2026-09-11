# frozen_string_literal: true

require './lib/response_gem'

RSpec.describe 'ResponseGem' do
  context 'Verify response invalid' do
    it 'Should return 0 if the url is valid' do
      expect(ResponseGem.verify_response_invalid(Faraday.get('https://rubygems.org/api/v1/gems/rails.json'))).to eq 0
    end
    it 'Raises an error if the url is invalid' do
      expect do
        ResponseGem.verify_response_invalid(Faraday.get('https://rubygems.org/api/v1/gems/railsss.json'))
      end.to raise_error(ResponseGem::GemApiError)
    end
  end
end
