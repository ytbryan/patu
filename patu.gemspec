# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'patu/version'
require 'patu/post_message'

Gem::Specification.new do |spec|
  spec.name          = "patu"
  spec.version       = Patu::VERSION
  spec.authors       = ["Bryan Lim"]
  spec.email         = ["ytbryan@gmail.com"]
  spec.summary       = %q{ Patu is a simple command line scraper for daily scraping.}
  spec.description   = %q{ Patu is a simple command line scraper for daily scraping.}
  spec.homepage      = "http://github.com/ytbryan/patu"
  spec.license       = "MIT"
  spec.post_install_message = Log::MESSAGE

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["patu"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'thor' , '~> 0.19.1'
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
