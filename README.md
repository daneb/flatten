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

## Testing

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/flatten. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

