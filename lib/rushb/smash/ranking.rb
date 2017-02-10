module Rushb
  module Smash

    class Ranking < ::APISmith::Smash
      property :id
      property :rating
      property :previous_rating
      property :match_id
      property :player_id
      property :created_at
      property :updated_at
      property :related_ranking, transformer: Ranking
    end

  end
end
