module Rushb
  module Resources
    module Game
      def games(options = {})
        parse_response(self.class.get('/games', { query: @options.merge(options), headers: request_headers }))
      end

      def show_game(id)
        parse_response(self.class.get("/games/#{id}", { query: @options, headers: request_headers }))
      end

      def create_game(params = {})
        parse_response(self.class.post("/games?api_key=#{@options[:api_key]}&format=json", { body: { game: params }, headers: request_headers }))
      end

      def destroy_game(id)
        parse_response(self.class.delete("/games/#{id}", { query: @options, headers: request_headers }))
      end

      def game_rankings(id, options = {})
        parse_response(self.class.get("/games/#{id}/rankings", { query: @options.merge(options), headers: request_headers }))
      end

      def rerank_game(id)
        parse_response(self.class.post("/games/#{id}/rerank", { query: @options, headers: request_headers }))
      end

      def top_players(game_ids, options = {})
        parse_response(self.class.get("/games/top_players", { query: @options.merge(options).merge({ game_ids: game_ids }), headers: request_headers }))
      end
    end
  end
end
