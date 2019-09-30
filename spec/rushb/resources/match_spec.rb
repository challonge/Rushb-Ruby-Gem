require 'rspec'
require 'rushb'
require_relative '../../support/vcr.rb'

RSpec.describe Rushb::Resources::Match, type: :client, vcr: true do
  let!(:client) { Rushb::Client.new('4cdb7f00862e0133005b033abce37ff2') }
  let!(:game_id) { 169961 }

  describe "#matches" do
    it 'returns with the matches of the game' do
      response = client.matches(game_id)

      expect(response.class).to eq Array
      expect(response.first["id"]).to eq 2173724
      expect(response.first["game_id"]).to eq game_id
    end
  end

  describe "#show_match" do
    it "returns with the match of the game" do
      response = client.show_match(game_id, 2173724)

      expect(response.class).to eq Hash
      expect(response["id"]).to eq 2173724
      expect(response["game_id"]).to eq game_id
    end
  end

  describe "#create_match" do
    let!(:player1) { client.create_player(game_id) }
    let!(:player2) { client.create_player(game_id) }

    it "creates a match without a winner" do
      response = client.create_match(game_id, { player1_id: player1["id"], player2_id: player2["id"] })

      expect(response.class).to be Hash
      expect(response["id"]).to eq 2217755
      expect(response["player1_id"]).to eq player1["id"]
      expect(response["player2_id"]).to eq player2["id"]
      expect(response["winner_id"]).to eq nil
    end

    it "creates a match with a winner" do
      response = client.create_match(game_id, { player1_id: player1["id"], player2_id: player2["id"], winner_id: player1["id"] })

      expect(response.class).to be Hash
      expect(response["id"]).to eq 2217756
      expect(response["player1_id"]).to eq player1["id"]
      expect(response["player2_id"]).to eq player2["id"]
      expect(response["winner_id"]).to eq player1["id"]
    end

    it "doesn't create a match" do
      expect {
        client.create_match(game_id)
      }.to raise_error(Rushb::ClientError)
    end
  end

  describe "#update_match" do
    let!(:player1) { client.create_player(game_id) }
    let!(:player2) { client.create_player(game_id) }

    it "updates a match" do
      match = client.create_match(game_id, { player1_id: player1["id"], player2_id: player2["id"] })
      response = client.update_match(game_id, match["id"], { player1_id: player2["id"], player2_id: player1["id"] })

      expect(response.class).to be Hash
      expect(response["id"]).to eq 2217761
      expect(response["player1_id"]).to eq player2['id']
      expect(response["player2_id"]).to eq player1['id']
      expect(response["winner_id"]).to eq nil
    end
  end

  describe "#destroy_match" do
    let!(:player1) { client.create_player(game_id) }
    let!(:player2) { client.create_player(game_id) }

    it "updates a match" do
      match = client.create_match(game_id, { player1_id: player1["id"], player2_id: player2["id"] })
      response = client.destroy_match(game_id, match["id"])

      expect(response.class).to be Hash
      expect(response["id"]).to eq 2217763
    end
  end

  describe "#match_rankings" do
    it "returns with the rankings with options" do
      response = client.match_rankings(game_id, 2173724, { page: 1, per_page: 1 })

      expect(response.count).to eq 1
      expect(response.class).to eq Array

      expect(response.first["id"]).to eq 240922856
      expect(response.first["rating"]).to eq 987
      expect(response.first["previous_rating"]).to eq 1000
    end

    it "returns with the rankings" do
      response = client.match_rankings(game_id, 2173724)

      expect(response.count).to eq 2
      expect(response.class).to eq Array

      expect(response.first["id"]).to eq 240922856
      expect(response.first["rating"]).to eq 987
      expect(response.first["previous_rating"]).to eq 1000
    end
  end
end
