module Rushb
  module V2
    module Resources
      module Player
        def players(game_id, options = {})
          parse_response(self.class.get("/games/#{game_id}/players", { query: @options.merge(options), headers: request_headers }))
        end

        def show_player(game_id, id)
          parse_response(self.class.get("/games/#{game_id}/players/#{id}", { query: @options, headers: request_headers }))
        end

        def create_player(game_id, params = {})
          parse_response(self.class.post("/games/#{game_id}/players?api_key=#{@options[:api_key]}&format=json", { body: { player: params }, headers: request_headers }))
        end

        def destroy_player(game_id, id)
          parse_response(self.class.delete("/games/#{game_id}/players/#{id}", { query: @options, headers: request_headers }))
        end

        def player_rankings(game_id, id, options = {})
          parse_response(self.class.get("/games/#{game_id}/players/#{id}/rankings", { query: @options.merge(options), headers: request_headers }))
        end
      end
    end
  end
end
