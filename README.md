# Patu

patu is a simple command line scraper for daily scraping. It is designed for usage not speed.

> Patu is a genus of spiders in the family Symphytognathidae that occurs in Colombia and Oceania. Patu digua is the smallest species of spider described to date.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'patu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install patu

## Usage

Type in your command prompt.
```
  patu <url> <css> #this will only yield a single column data

```


For mulitple webpages or multiple elements, use a data.yml to define patu
```
- path: "data.csv"
- url:
    https://rubygems.org/gems/aka2
    https://rubygems.org/gems/aka2
    https://rubygems.org/gems/aka2
    https://rubygems.org/gems/aka2
- column_array:
  - column:
      name: "well"
      pattern: "a.something"
  - column:
      name: "well"
      pattern: "a.something"
```

call patu, it will auto detect data.yml

```
patu
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ytbryan/patu. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

Patu is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
