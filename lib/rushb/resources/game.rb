module Rushb
  module Resources
    module Game

      # Pagination example:
      #  Rushb::Client::Game.new.all
      #  Rushb::Client::Game.new.all(page: 2)
      def games(options={})
        get 'games',
          :transformer => Rushb::Smash::Game,
          :extra_query => options
      end

      def show_game(id)
        get "games/#{id}",
          :transformer => Rushb::Smash::Game
      end

      def create_game(params={})
        post "games",
          :transformer => Rushb::Smash::Game,
          :extra_body  => {:game => params}
      end

      def destroy_game(id)
        delete "games/#{id}",
          :transformer => Rushb::Smash::Game
      end

    end
  end
end
