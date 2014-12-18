module Rushb
  module Smash

    class Ranking < ::APISmith::Smash
      property :id
      property :rating
      property :match_id
      property :player_id
      property :created_at
      property :updated_at
    end

  end
end
