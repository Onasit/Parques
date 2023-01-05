class Game < ApplicationRecord
  
  has_many :player_games, dependent: :destroy
  has_many  :players, through: :player_games
  has_many :deaths, dependent: :destroy
  belongs_to :season




  
  accepts_nested_attributes_for :player_games, allow_destroy: true

  validate :validate_player_uniqueness

  validates :game_cash, :death_cash, :first_blood_cash_victim, :first_blood_cash_players, presence: true
  validate :check_players
  

  validate :repeat_players


  #after_save :check_end_season


  def check_players
    if self.player_games.size < 2 
      errors.add(:base, "No ha inscrito suficientes jugadores")
    end
  end

  def check_end_season
    games = self.season.games.where.not(player_id: nil)
    player_ids = games.collect(&:player_id)

    hash_result = Hash.new(0)

    player_ids.each do |player_id|
      hash_result[player_id] +=1
    end

    self.season.update(completed: true, player_id: self.player_id) if hash_result.values.include?(10)
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

  
  def validate_player_uniqueness
    unless self.player_games.uniq == self.player_games
      errors.add(:base, "No se puede repetir jugadores")
    end
  end


end
