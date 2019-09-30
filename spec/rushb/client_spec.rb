require 'rspec'
require 'rushb'

RSpec.describe Rushb::Client do
  let!(:client) { Rushb::Client.new("xxx") }

  describe "#sending requests" do
    it "tries to send the request" do
      expect {
        client.games
      }.to raise_error(Rushb::ClientError)
    end
  end
end
