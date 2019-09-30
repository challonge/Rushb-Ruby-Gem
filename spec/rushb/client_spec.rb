require 'rspec'
require 'rushb'

RSpec.describe Rushb::Client do
  let!(:client) { Rushb::Client.new("xxx") }

  describe "#base_query_options" do
    it "returns a query hash for the api_key and format" do
      expect(client.base_query_options[:format]).to eq 'json'
      expect(client.base_query_options[:api_key]).to eq 'xxx'
    end
  end
end
