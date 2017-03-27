# Mps7

[![Build Status](https://travis-ci.org/wojno/mps7.svg?branch=master)](https://travis-ci.org/wojno/mps7)

[![Code Climate](https://codeclimate.com/github/wojno/mps7/badges/gpa.svg)](https://codeclimate.com/github/wojno/mps7)

[![Test Coverage](https://codeclimate.com/github/wojno/mps7/badges/coverage.svg)](https://codeclimate.com/github/wojno/mps7/coverage)

Binary protocol format consumption agent for the old-school mainframe, `MPS7`.  Reads proprietary binary for payment processing.

Implemented in a manner that could be leveraged in a `microservice` oriented environment.  A library which subscribes to the `Unix` philosophy: 

> do one thing and do it well


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mps7'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mps7

## Usage

This library accepts a `binary` record as input and returns an `array` of objects for downstream processing:

    Mps7::Process.new('txnlog.dat').execute

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wojno/mps7.

