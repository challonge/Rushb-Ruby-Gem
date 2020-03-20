module Rushb
  module Resources
    module Match
      def matches(game_id, options = {})
        parse_response(self.class.get("/games/#{game_id}/matches", { query: @options.merge(options), headers: request_headers }))
      end

      def show_match(game_id, id)
        parse_response(self.class.get("/games/#{game_id}/matches/#{id}", { query: @options, headers: request_headers }))
      end

      def create_match(game_id, params = {})
        parse_response(self.class.post("/games/#{game_id}/matches?api_key=#{@options[:api_key]}&format=json", { body: { match: params }, headers: request_headers }))
      end

      def update_match(game_id, id, params = {})
        parse_response(self.class.put("/games/#{game_id}/matches/#{id}?api_key=#{@options[:api_key]}&format=json", { body: { match: params }, headers: request_headers }))
      end

      def destroy_match(game_id, id)
        parse_response(self.class.delete("/games/#{game_id}/matches/#{id}", { query: @options, headers: request_headers }))
      end

      def match_rankings(game_id, id, options = {})
        parse_response(self.class.get("/games/#{game_id}/matches/#{id}/rankings", { query: @options.merge(options), headers: request_headers }))
      end
    end
  end
end
