module Rushb
  module Client

    class Game < ::RocketPants::Client
      version  1
      base_uri 'http://elo.dev'

      def base_query_options
        {:format => 'json', :api_key => '5cc6d9601b9d01329c7a482a142a36ba'}
      end

      #  Rushb::Client::Game.new.all
      #  Rushb::Client::Game.new.all(page: 2)
      def all(options={})
        get 'games', :transformer => Rushb::Smash::Game, :extra_query => options
      end

      def show(id)
        get "games/#{id}", :transformer => Rushb::Smash::Game
      end

    end

  end
end
