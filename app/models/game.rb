class Game < ApplicationRecord
  
  has_many :player_games
  has_many  :players, through: :player_games
  has_many :deaths
  
  accepts_nested_attributes_for :player_games, allow_destroy: true

  validates :game_cash, :death_cash, presence: true
  validate :check_players

  validate :repeat_players





  def check_players
    if self.player_games.size < 2 
      errors.add(:base, "No a inscrito suficientes jugadores")
    end
  end

  def winner
    Player.find(self.player_id)
  end

  private

  def repeat_players

    id_players = self.player_games.to_a.collect(&:player_id)
 
    unless id_players.detect{ |e| id_players.count(e) > 1 } == nil
      errors.add(:base, "Estas repitiendo jugadores")
    end 
  end

  
end
