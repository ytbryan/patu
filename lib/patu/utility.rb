require 'nokogiri'
require 'open-uri'
require 'csv'
require 'yaml'

module X

  def process_argv(url, pattern)
    web_page = Nokogiri::HTML(open(url))
    scraped_result = web_page.css(pattern)
    print_csv(scraped_result, scraped_result.count)
  end


  def print_csv value, count
    a = Array.new(count)
    if !File.exists?("data.csv")
      FileUtils.touch 'data.csv'
      CSV.open("data.csv", "wb") do |csv|
        csv << ["date", "time"] +  a.each_with_index.map { |i,y| "value#{y+1}" }# a.collect {|num| "value" + num}
      end
    end

    CSV.open("data.csv", "ab") do |csv|
        csv << [Date.today, Time.now.strftime("%I:%M%p")] + value.to_a
    end
  end

end
