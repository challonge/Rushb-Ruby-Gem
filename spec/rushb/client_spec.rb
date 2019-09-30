require 'rspec'
require 'rushb'

RSpec.describe Rushb::Client do
  let!(:client) { Rushb::V2::Client.new("xxx") }

  describe "#sending requests" do
    it "tries to send the request" do
      expect {
        client.games
      }.to raise_error(Rushb::V2::ClientError)
    end
  end
end
