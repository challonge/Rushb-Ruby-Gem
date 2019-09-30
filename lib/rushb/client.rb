require 'rushb/resources/game'
require 'rushb/resources/match'
require 'rushb/resources/player'

module Rushb
  class ClientError < StandardError; end

  class Client
    include HTTParty

    include Rushb::Resources::Game
    include Rushb::Resources::Match
    include Rushb::Resources::Player

    format :json
    base_uri "http://elo.challonge.com/1/"
    default_timeout 5

    OPTION_DEFAULTS = {
      format: :json
    }

    HEADER_DEFAULTS = {
      "User-Agent" => "HTTParty"
    }

    def initialize(api_key, cache = nil)
      @options = OPTION_DEFAULTS.merge(api_key: api_key)
      @cache = nil
    end

    private

    def parse_response(resp)
      if resp.code == 200 || resp.code == 201
        if !@cache.nil?
          @cache.write(unique_cache_tag, resp.headers['etag'])
          @cache.write(resp.headers['etag'], resp.parsed_response['response'])
        end

        resp.parsed_response["response"]
      elsif resp.code == 304
        @cache.read(resp.headers['etag']) if !@cache.nil?
      else
        raise ClientError, "#{resp.code} #{resp.message}"
      end
    end

    def request_headers
      if !@cache.nil? && @cache.read(unique_cache_tag).present?
        HEADER_DEFAULTS.merge(
          {
            "If-None-Match" => @cache.read(unique_cache_tag)
          }
        )
      else
        HEADER_DEFAULTS
      end
    end

    def unique_cache_tag
      "#{__method__}-#{__id__}-#{cache_tag_date}"
    end

    def cache_tag_date
      DateTime.now.to_i
    end
  end
end
