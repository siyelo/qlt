# Qlt

This is a Ruby gem that serves as a wrapper for Internet Solutions' Quick Lookup Tool (QLT) API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'qlt'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qlt

## Usage

### Configuration

Configuration is done by providing an environment variable in the configuration block. Example:

```ruby
Qlt.configure do |config|
  config.env = :production
end
```

### Fetching possible solutions

Fetching of available solutions (and the price) is done via the ```Qlt.prices``` method.

```ruby
Qlt.prices({ latitude: '12.12', longitude: '13.13', wireless: true, speed: 10, term: 12 })
```

Sends a lookup request for the given parameters. Returns a ```Qlt::Response``` object that contains:
- the searched coordinates
- the price of the solution
- a list of possible solutions
  - a solution can be of type ```Qlt::FibreNode``` or ```Qlt::WiFiNode```

### Available Entities

- ```Qlt::Response``` is an entity that holds all of the returned data from the QLT API.
- ```Qlt::Location``` is an entity representing a location, holds the latitude and longitude coordinates.
- ```Qlt::Price``` is an entity that holds the pricing data. Contains the **mrc** and **nrc** prices.
- ```Qlt::WifiNode``` is an entity representing a WiFi solution. Contains:
  - ```type```
  - ```highsite``` - the name of the node
  - ```distance``` - distance between the node and the customer location
  - ```location``` - Qlt::Location object, representing the location of the node
- ```Qlt::FibreNode``` is an entity representing a Fibre solution. Contains:
  - ```zone``` - the zone where the node is
  - ```type```
  - ```name``` - the name of the node
  - ```distance``` - distance between the node and the customer location
  - ```location``` - Qlt::Location object, representing the location of the node

## In the future

Currently, since we are not writing data to the API, authentication headers are not needed.
There's code in place for that, but it's out of the current scope. In the future if
the gem should write customer solution data to the QLT, the ```key``` and ```secret``` attributes
should be added as a part of the gem runtime configuration, like:

```ruby
Qlt.configuration do |c|
  c.env = :production
  c.key = 'YOUR_KEY'
  c.secret = 'YOUR_SECRET'
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/qlt/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
