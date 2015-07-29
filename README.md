# Rushb

Rushb ELO Ranking System by CHALLONGE! LLC

API Documentation can be found at https://www.mashape.com/akdarrah/rushb-elo-engine/overview.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rushb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rushb

## Usage

```ruby
>> require 'rushb'
=> true
>> c = Rushb::Client.new("5cc6d9601b9d01329c7a482a142a36ba")
=> #<Rushb::Client:0x007fbb4fb47578 @api_key="5cc6d9601b9d01329c7a482a142a36ba">
>> c.games
=> [#<Rushb::Smash::Game application_id=1 created_at="2014-09-11T04:52:55.012Z" default_k_factor=15 default_rating=1000 id=1 pro_rating_boundry=2400 starter_boundry=30 updated_at="2014-09-11T04:52:55.012Z">, ...]
>> c.games(page: 2)
=> [#<Rushb::Smash::Game application_id=1 created_at="2014-12-18T05:00:53.980Z" default_k_factor=15 default_rating=1000 id=32 pro_rating_boundry=2400 starter_boundry=30 updated_at="2014-12-18T05:00:53.980Z">, ...]
>> c.create_game
=> #<Rushb::Smash::Game application_id=1 created_at="2014-12-19T06:12:29.733Z" default_k_factor=15 default_rating=1000 id=43 pro_rating_boundry=2400 starter_boundry=30 updated_at="2014-12-19T06:12:29.733Z">
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rushb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
