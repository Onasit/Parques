class Game < ApplicationRecord
  
  has_many :player_game
  has_many  :players, through: :player_game
  
  accepts_nested_attributes_for :player_games
end
