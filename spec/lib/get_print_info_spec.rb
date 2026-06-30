# frozen_string_literal: true

RSpec.describe 'GetPrintInfo' do
  context 'Method print_name_info' do
    it 'Should print the name and the info of a single gem' do
      data = {
        'name' => 'rails',
        'info' => 'Ruby on Rails is a full-stack web framework optimized for programmer happiness and sustainable productivity.'
      }
      expect { GetPrintInfo.print_name_info(data) }.to output(/rails/).to_stdout
    end
  end

  context 'Method print_name_info_list' do
    it 'Should print the name and the info of multiple gems' do
      data = [
        {
          'name' => 'rails',
          'info' => 'Ruby on Rails is a full-stack web framework optimized for programmer happiness and sustainable productivity.'
        },
        {
          'name' => 'sinatra',
          'info' => 'Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort.'
        }
      ]
      expect { GetPrintInfo.print_name_info_list(data) }.to output(/rails/).to_stdout
      expect { GetPrintInfo.print_name_info_list(data) }.to output(/sinatra/).to_stdout
    end
  end
end
