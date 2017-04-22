# Flatten

Flattens an arbitrarily nested array of integers. 

e.g.
```ruby
[ 1, [ 2, [ 3 ] ], 4 ]  -> [ 1, 2, 3, 4 ] 
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flatten'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flatten

## Usage

```ruby
irb(main):001:0> require 'flatten'
=> true
irb(main):002:0> input = [1, 2, 3, [], [4, 5, 6, [], [7, 8, 9, [10, 11, []]]], [], []]
=> [1, 2, 3, [], [4, 5, 6, [], [7, 8, 9, [10, 11, []]]], [], []]
irb(main):003:0> Flatten.to_flat(input)
=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
irb(main):004:0>
```

## Testing and CI

Test framework is RSpec.

```bash
# rspec
```

[CI](https://travis-ci.org/daneb/flatten) can be found here.

## Documentation

Basic documentation with YARD

```ruby
# yard doc
# yard server
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/daneb/flatten. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

