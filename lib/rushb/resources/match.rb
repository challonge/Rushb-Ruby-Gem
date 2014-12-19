module Rushb
  module Resources
    module Match

      def matches(game_id, options={})
        get "games/#{game_id}/matches",
          :transformer => Rushb::Smash::Match,
          :extra_query => options
      end

      def show_match(game_id, id)
        get "games/#{game_id}/matches/#{id}",
          :transformer => Rushb::Smash::Match
      end

      def create_match(game_id, params={})
        post "games/#{game_id}/matches",
          :transformer => Rushb::Smash::Match,
          :extra_body  => {:match => params}
      end

      def update_match(game_id, id, params={})
        put "games/#{game_id}/matches/#{id}",
          :transformer => Rushb::Smash::Match,
          :extra_body  => {:match => params}
      end

      def destroy_match(game_id, id)
        delete "games/#{game_id}/matches/#{id}",
          :transformer => Rushb::Smash::Match
      end

      def match_rankings(game_id, id, options={})
        get "games/#{game_id}/matches/#{id}/rankings",
          :transformer => Rushb::Smash::Ranking,
          :extra_query => options
      end

    end
  end
end
