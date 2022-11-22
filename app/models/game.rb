class Game < ApplicationRecord
  
  has_many :player_games
  has_many  :players, through: :player_games
  has_many :deaths
  
  accepts_nested_attributes_for :player_games, reject_if: :all_blank, allow_destroy: true

  validates :game_cash, :death_cash, presence: true
  validate :check_players

  def check_players
    if self.player_games.size < 2 
      errors.add(:base, "No a inscrito suficientes jugadores")
    end
  end

  def winner
    Player.find(self.player_id)
  end
  
end
