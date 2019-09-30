require 'rspec'
require 'rushb'
require 'pry'
require_relative '../../support/vcr.rb'

RSpec.describe Rushb::Resources::Game, type: :client, vcr: true do
  let!(:client) { Rushb::V2::Client.new("4cdb7f00862e0133005b033abce37ff2") }

  describe '#games' do
    it 'returns with the games?' do
      response = client.games({ page: 1, per_page: 20 })

      expect(response.length).to eq 20
      expect(response.first["id"]).to eq 176248
      expect(response.first["default_k_factor"]).to eq 15
      expect(response.first["default_rating"]).to eq 1000

      response = client.games({ page: 2, per_page: 25 })

      expect(response.length).to eq 25
      expect(response.first["id"]).to eq 169961
      expect(response.first["default_k_factor"]).to eq 15
      expect(response.first["default_rating"]).to eq 1000
    end
  end

  describe "#show_game" do
    it "returns with the game object" do
      response = client.show_game(176248)

      expect(response["application_id"]).to eq 6
      expect(response["default_rating"]).to eq 1000
      expect(response["default_k_factor"]).to eq 15
      expect(response["pro_rating_boundry"]).to eq 2400
    end
  end

  describe "#create_game" do
    it "creates a game record" do
      response = client.create_game
      
      expect(response["id"]).to eq 178283
    end

    it "creates a game record with the params passed" do
      response = client.create_game({ default_rating: 2000, pro_rating_boundary: 5000 })

      expect(response["id"]).to eq 178284
    end
  end

  describe "#destroy_game" do
    it "destroys the game with the id provided" do
      response = client.destroy_game(178274)

      expect(response["id"]).to eq 178274
    end
  end

  describe "#game_rankings" do
    it "returns with the game ranking list" do
      response = client.game_rankings(169961)

      expect(response.length).to eq 2

      expect(response.first["rating"]).to eq 987
      expect(response.first["previous_rating"]).to eq 1000
    end

    it "returns with the game rankings" do
      response = client.game_rankings(169961, { page: 1, per_page: 1 })

      expect(response.length).to eq 1

      expect(response.first["rating"]).to eq 987
      expect(response.first["previous_rating"]).to eq 1000
    end
  end

  describe "#top_players" do
    it "returns with the top players for the game" do
      response = client.top_players([169961])
          
      expect(response.length).to eq 1
      expect(response.first["top_player"]["rating"]).to eq 1012
      expect(response.first["top_player"]["player_id"]).to eq 596495
    end
  end
end
