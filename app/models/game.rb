class Game < ApplicationRecord
  
  has_many :player_games
  has_many  :players, through: :player_games
  has_many :deaths
  
  accepts_nested_attributes_for :player_games, reject_if: :all_blank, allow_destroy: true
end
