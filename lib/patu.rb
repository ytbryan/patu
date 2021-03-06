require "patu/version"
require 'thor'
require 'nokogiri'
require 'open-uri'
require 'csv'
require 'yaml'

module Patu
  class Base < Thor

    package_name 'patu'
    default_task :print

    desc :data, 'generate a default data.yml'
    def data
      FileUtils.cp 'data.yml', './'
    end

    desc :test, 'print out scrapped result on terminal'
    def test url, pattern=nil
      test_process_argv(url, pattern)
    end


    desc :scrap, 'patu scrap <url> <pattern>'
    def scrap url, pattern
      process_argv(url, pattern)
    end

    desc :go, 'run the data.yml in current directory.'
    def go
      if File.exists?("data.yml")
        data = YAML.load_file("data.yml")
        data["data"].each_with_index do |value, index|
          process_argv(value["url"], value["pattern"])
        end if data["data"]
      else
        puts "[cannot find data.yml] See http://github.com/ytbryan/patu/data.yml for example"
      end
    end

    desc :print, ''
    def print
      puts "
      ██████╗  █████╗ ████████╗██╗   ██╗
      ██╔══██╗██╔══██╗╚══██╔══╝██║   ██║
      ██████╔╝███████║   ██║   ██║   ██║
      ██╔═══╝ ██╔══██║   ██║   ██║   ██║
      ██║     ██║  ██║   ██║   ╚██████╔╝
      ╚═╝     ╚═╝  ╚═╝   ╚═╝    ╚═════╝

|| patu is a simple command-line scraper for everyday scraping.
|| http://github.com/ytbryan/patu
|| See full commands: patu -h

      "
    end


    private


    def test_process_argv(url, pattern)

      if pattern == nil
        puts web_page = Nokogiri::HTML(open(url))
      else
        web_page = Nokogiri::HTML(open(url))
      end
      scraped_result = web_page.css(pattern)
      # print_csv(scraped_result, scraped_result.count)
      puts "#{scraped_result} \n=======\nfound #{scraped_result.count} for pattern #{pattern}"
    end

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
end
