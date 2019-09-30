require 'rspec'
require 'rushb'

require_relative '../../support/vcr.rb'

RSpec.describe Rushb::Resources::Player, type: :client, vcr: true do
  let!(:client) { Rushb::V2::Client.new('4cdb7f00862e0133005b033abce37ff2') }
  let!(:game_id) { 169961 }

  describe "#players" do
    it "returns the players for that game without options" do
      response = client.players(game_id)

      expect(response.count).to eq 2
      expect(response.first["id"]).to eq 568368
      expect(response.first["pro"]).to be_falsey
      expect(response.first["rating"]).to eq 1012
    end

    it "returns the players for that game with options" do
      response = client.players(game_id, { page: 1, per_page: 1 })

      expect(response.count).to eq 1
      expect(response.first["id"]).to eq 568368
      expect(response.first["pro"]).to be_falsey
      expect(response.first["rating"]).to eq 1012
    end

    it "returns the players for that game with options (player_ids)" do
      response = client.players(game_id, { page: 1, per_page: 1, ids: 568368 })

      expect(response.count).to eq 1
      expect(response.first["id"]).to eq 568368
      expect(response.first["pro"]).to be_falsey
      expect(response.first["rating"]).to eq 1012
    end
  end

  describe "#show_player" do
    it "returns the player details" do
      response = client.show_player(game_id, 568368)

      expect(response.class).to eq Hash
      expect(response["id"]).to eq 568368
      expect(response["pro"]).to be_falsey
      expect(response["rating"]).to eq 1012
    end
  end

  describe "#create_player" do
    it "creates a player" do
      response = client.create_player(game_id)

      expect(response.class).to eq Hash
      expect(response["id"]).to eq 596484
      expect(response["pro"]).to be_falsey
      expect(response["rating"]).to eq 1000
    end

    it "creates a player with params" do
      response = client.create_player(game_id, { pro: true })

      expect(response.class).to eq Hash
      expect(response["id"]).to eq 596485
      expect(response["pro"]).to be_falsey
      expect(response["rating"]).to eq 1000
    end
  end

  describe "#destroy_player" do
    it "deletes the player" do
      response = client.destroy_player(game_id, 596485)

      expect(response.class).to eq Hash
      expect(response["id"]).to eq 596485
    end
  end

  describe "#player_rankings" do
    it "returns with the player rankings without options" do
      response = client.player_rankings(game_id, 568368)

      expect(response.count).to eq 1
      expect(response.class).to eq Array
      expect(response.first["rating"]).to eq 1012
    end

    it "returns with the player rankings with options" do
      response = client.player_rankings(game_id, 568368, { page: 1, per_page: 1 })

      expect(response.count).to eq 1
      expect(response.class).to eq Array
      expect(response.first["rating"]).to eq 1012
    end
  end
end
