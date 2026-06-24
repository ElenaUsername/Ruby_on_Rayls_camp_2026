class GetPrintInfo

  def self.print_name_info(data_about_gem)

    puts "Fetching information for gem: #{data_about_gem['name']}..."
    puts "Name: #{data_about_gem['name']} \nInfo: #{data_about_gem['info']}"
  end

  def self.print_name_info_list(data)
    data.each do |gem|
      GetPrintInfo.print_name_info(gem)
    end
  end
end