require "patu/version"
require 'patu/utility'
require 'thor'


module Patu
  class Base < Thor
    check_unknown_options!
    package_name 'patu'

    desc :default, ''
    def default url=nil, pattern=nil
      if url && pattern
        X::process_argv(url, pattern)
      else
        if File.exists?("data.yml")
          puts "data.yml exists"
        else
          puts "nothing happen. Enter at least two arguments. pata <url> <pattern>"
        end
      end

    end

    desc :start, 'list the project alias (short alias: p)'
    def weave(url, pattern=nil)
      puts "interesting -> #{url}"
    end

    desc :pattern, 'list the project alias (short alias: p)'
    def pattern()
    end

  end
end




__END__

require 'nokogiri'
require 'open-uri'
require 'yaml'
# require 'csv'




puts "yes, argv" if ARGV
puts ARGV.count
puts ARGV

#read in the yml file
if File.exists?("data.yml")
  config = YAML.load_file("data.yml")
end

### you need to verify data.yml and everything is filled

puts config.inspect

#assign the urls to the urls variable
urls = config["urls"]
puts urls
puts "urls -> #{urls.count}"

#assign the number of columns into column variables
columns = config["columns"]
puts columns
puts "columns -> #{columns.count}"

puts selectors = config["selectors"]
puts "selectors -> #{config["selectors"].count}"

#the name of the output file
# urls = %w(https://rubygems.org/gems/aka2
#          https://rubygems.org/gems/typing
#          https://rubygems.org/gems/chart
#          https://rubygems.org/gems/highlighting)

# everyday = []
# eachday = []
array = []
urls.each_with_index do |value, index|
  page = Nokogiri::HTML(open(value))
  array = page.css(selectors[index])#.text if page.css(selectors[index])!= nil
end

puts array.count
puts array

#
# #check the presence of data.csv
# if !File.exists?("data.csv")
#   FileUtils.touch 'data.csv'
#   CSV.open("data.csv", "wb") do |csv|
#     csv << ["date","aka2", "typing", "chart", "highlighting","aka2 - today", "typing - today", "chart - today", "highlighting - today"]
#   end
# end
#
# #put it inside csv
# CSV.open("data.csv", "ab") do |csv|
#     csv << [Date.today, everyday[0],everyday[1],everyday[2],everyday[3],eachday[0],eachday[1],eachday[2],eachday[3]]
# end
