# Autobuy

Ruby gem and rake task to automate scheduled crypto buys on Coinbase Pro.

The easiest way to run this is to deploy it to heroku and setup a scheduler to run the task.

`rake trade`

To make buys in differnet markets set an environment variable with the key as the market product id (replace the '-' with '\_' ) and the value with the amount you'd like to purchase. You must replace the - with \_ since ENVs can't have hyphens. The rake task will replace the \_ with a - for the correct product code.

`ETH_USD=10` will buy $10 worth of ETH

Other environment variables you will need can be seen in .env.example


Profit!!!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'autobuy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install autobuy

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/autobuy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Autobuy project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/autobuy/blob/master/CODE_OF_CONDUCT.md).
