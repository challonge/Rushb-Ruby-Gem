module Rushb
  module Resources
    module Player

      def players(game_id, options={})
        get "games/#{game_id}/players",
          :transformer => Rushb::Smash::Player,
          :extra_query => options
      end

      def show_player(game_id, id)
        get "games/#{game_id}/players/#{id}",
          :transformer => Rushb::Smash::Player
      end

      def create_player(game_id, params={})
        post "games/#{game_id}/players",
          :transformer => Rushb::Smash::Player,
          :extra_body  => {:player => params}
      end

      def destroy_player(game_id, id)
        delete "games/#{game_id}/players/#{id}",
          :transformer => Rushb::Smash::Player
      end

      def player_rankings(game_id, id, options={})
        get "games/#{game_id}/players/#{id}/rankings",
          :transformer => Rushb::Smash::Ranking,
          :extra_query => options
      end

    end
  end
end
