# B2

A simple ruby client for the [Backblaze B2](https://www.backblaze.com/b2/cloud-storage.html) API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'b2'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install b2

## Usage

Create an account and get your APP KEY and APP KEY ID from your Backblaze B2 Cloud Storage account. More info [here](https://www.backblaze.com/b2/docs/application_keys.html)

create a B2 client:

```
client = B2.create_client do |config|
  config.app_key = "APP_KEY"
  config.app_key_id = "APP_KEY_ID"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jaime-evr/b2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jaime-evr/b2/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the B2 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jaime-evr/b2/blob/master/CODE_OF_CONDUCT.md).
