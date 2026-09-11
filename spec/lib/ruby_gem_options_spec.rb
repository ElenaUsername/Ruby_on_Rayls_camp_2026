# frozen_string_literal: true

require './lib/ruby_gem_options'
require 'json'

def test_for_show(name, result)
  expect(RubyGemOptions.show_gem_info(name)).to eq(result)
end

def test_for_search(name, raw_json_data)
  if raw_json_data.nil?
    expect { RubyGemOptions.search_gem_info(name) }.to raise_error(ResponseGem::GemApiError)
  else
    result_metoda = RubyGemOptions.search_gem_info(name)
    nume_returnate = result_metoda.map { |gem| gem['name'] }
    expect(nume_returnate).to all(include(name))
  end
end

def test_for_filter_by_license(data, license, expected_count)
  result = RubyGemOptions.filter_information_by_licence(data, license)

  if license.nil?
    expect(result.length).to eq(expected_count)
  else
    expect(result).to all(include('licenses' => include(license)))
  end
end

def test_for_filter_by_downloads(data, expected_order)
  result = RubyGemOptions.filter_information_by_downloads(data)
  expect(result.map { |gem| gem[:downloads] }).to eq(expected_order)
end

RSpec.describe 'RubyGemOptions' do
  context '.show_gem_info' do
    let(:json_data) { File.read(File.join(__dir__, 'fixtures', 'show', 'rails.json')) }
    let(:gem_description) do
      parsed = JSON.parse(json_data)
      parsed['info']
    end
    it 'Gets the description of a valid gem' do
      test_for_show('rails', gem_description)
    end

    it 'Returns an error for an invalid gem' do
      expect { RubyGemOptions.show_gem_info('railsss') }.to raise_error(ResponseGem::GemApiError)
    end
  end

  context '.search_gem_info' do
    let(:json_data) { File.read(File.join(__dir__, 'fixtures', 'search', 'rails.json')) }

    it 'Gets the list of gems for a valid search term' do
      test_for_search('rails', json_data)
    end

    it 'uses cached search data without making another API request' do
      cache = RubyGemOptions.instance_variable_get(:@cache)
      allow(cache).to receive(:get).with('search_rails').and_return(json_data)

      expect(ResponseGem).not_to receive(:fetch_url_response)
      expect(RubyGemOptions.search_gem_info('rails')).to be_an(Array)
    end

    it 'Returns an error for an invalid gem' do
      test_for_search('railsss', nil)
    end
  end

  context '.filter_information_by_licence' do
    let(:json_data) { File.read(File.join(__dir__, 'fixtures', 'search', 'rails.json')) }
    let(:data) { JSON.parse(json_data) }

    it 'Returns all data when license name is nil' do
      test_for_filter_by_license(data, nil, data.length)
    end

    it 'Return only gems with the specified license' do
      test_for_filter_by_license(data, 'MIT', data.length)
    end
  end

  context '.filter_information_by_downloads' do
    let(:gems_with_symbol_keys) do
      [
        { downloads: 100, name: 'gem_c' },
        { downloads: 9999, name: 'gem_a' },
        { downloads: 450,  name: 'gem_b' }
      ]
    end

    it 'Sorts gems in descending order by downloads' do
      test_for_filter_by_downloads(gems_with_symbol_keys, [9999, 450, 100])
    end
  end

  context 'when both filters are applied' do
    let(:gems_with_mixed_licences_and_downloads) do
      [
        { 'name' => 'gem_a', 'licenses' => ['MIT'], downloads: 100 },
        { 'name' => 'gem_b', 'licenses' => ['Apache-2.0'], downloads: 9999 },
        { 'name' => 'gem_c', 'licenses' => ['MIT'], downloads: 450 }
      ]
    end

    it 'filters by licence and then sorts by downloads' do
      filtered = RubyGemOptions.filter_information_by_licence(gems_with_mixed_licences_and_downloads, 'MIT')
      result = RubyGemOptions.filter_information_by_downloads(filtered)

      expect(result.map { |gem| gem['name'] }).to eq(%w[gem_c gem_a])
    end
  end
end
