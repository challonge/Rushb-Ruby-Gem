module Rushb
  class Client < ::RocketPants::Client

    include Rushb::Resources::Game
    include Rushb::Resources::Player
    include Rushb::Resources::Match

    version 1
    base_uri 'http://www.rushb.tv'

    def initialize(api_key)
      @api_key = api_key
    end

    def base_query_options
      {:format => 'json', :api_key => @api_key}
    end

  end
end
