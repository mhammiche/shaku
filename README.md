# Shaku

[![Build Status](https://travis-ci.org/mhammiche/shaku.svg?branch=master)](https://travis-ci.org/mhammiche/shaku)
[![Coverage Status](https://coveralls.io/repos/mhammiche/shaku/badge.svg?branch=master&service=github)](https://coveralls.io/github/mhammiche/shaku?branch=master)
[![Code Climate](https://codeclimate.com/github/mhammiche/shaku/badges/gpa.svg)](https://codeclimate.com/github/mhammiche/shaku)
[![Inline docs](http://inch-ci.org/github/mhammiche/shaku.svg?branch=master)](http://inch-ci.org/github/mhammiche/shaku)

Shaku is a little gem that handle Measurement calculation and conversion. It is still in its early development phase so the current project is just a boiler plate.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shaku'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shaku

## Usage

### Basic arithmetics operations

```ruby
a = Shaku::Measure.new(10, 'cm') # => (10.0 cm)
b = Shaku::Measure.new(3, 'cm') # => (3.0 cm)

a + b # => (15.0 cm)
a - b # => (7.0 cm)

a * 2 # => (20.0 cm)
a / 2 # => (5.0 cm)
```

Currently Shaku does not provides any conversion feature. All examples below will raise an exception even some are meaningful.

```ruby
a = Shaku::Measure.new(10, 'cm')
b = Shaku::Measure.new(10, 'km')

a + 3.0 # => TypeError: Cannot convert Float to Measure
a + b # ArgumentError: Inconsistent unit
```

Multiply and divide are not commutative. Hence the example below have no meaning.


```ruby
a = Shaku::Measure.new(10, 'cm')
2 * a # => TypeError: Shaku::Measure can't be coerced into Fixnum
2 / a # => TypeError: Shaku::Measure can't be coerced into Fixnum
```

### Syntax shortcut

In interactive you can save some keystrocks by extending the main object with `Shaku` module

```ruby
extend Shaku
# => main
a = Measure(3, 'cm')
# => (3.0 cm)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Todo

* More exhaustive measure arithmetics
* Unit conversion
* SI unit database
* Unit arithmetics

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mhammiche/shaku. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

