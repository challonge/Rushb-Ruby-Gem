module Rushb
  module Smash

    class Match < ::APISmith::Smash
      property :id
      property :game_id
      property :player1_id
      property :player2_id
      property :winner_id
      property :played_at
      property :created_at
      property :updated_at
    end

  end
end
