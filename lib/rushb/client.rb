module Rushb
  class Client < ::RocketPants::Client

    include Rushb::Resources::Game

    version 1
    base_uri 'http://elo.dev'

    def initialize(api_key)
      @api_key = api_key
    end

    def base_query_options
      {:format => 'json', :api_key => @api_key}
    end

  end
end
