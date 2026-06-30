# frozen_string_literal: true

class GetPrintInfo
  def self.print_name_info(data_about_gem)
    puts "#{data_about_gem['name']}: #{data_about_gem['info']}\n"
  end

  def self.print_name_info_list(data)
    data.each do |gem|
      GetPrintInfo.print_name_info(gem)
    end
  end
end
