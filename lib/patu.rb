require "patu/version"
require 'thor'

module Patu
  class Base < Thor
    check_unknown_options!
    package_name 'patu'

    desc :start, 'list the project alias (short alias: p)'
    def start
      puts "interesting"
    end
  end
end
