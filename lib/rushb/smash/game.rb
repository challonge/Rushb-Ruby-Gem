module Rushb
  module Smash

    class Game < ::APISmith::Smash
      property :id
      property :application_id
      property :default_k_factor
      property :default_rating
      property :pro_rating_boundry
      property :starter_boundry
      property :created_at
      property :updated_at
    end

  end
end
