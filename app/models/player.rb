class Player < ApplicationRecord
  
  has_many :player_games
  has_many :games, through: :player_games
  has_many :won_games, class_name: "Game", foreign_key: "player_id"

  mount_uploader :image, PlayerUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  def assassin_counter
    Death.where(assassin_id: self.id).count
  end
  def victim_counter
    Death.where(victim_id: self.id).count
  end

  def finanzas_games_ganados
    ganancias_games = 0
    self.won_games.each do |game| 
      ganancias_games += (game.players.count) * (game.game_cash)
    end
    ganancias_games
  end

  def finanzas_muertes
    ganancias_muertes = 0
    self.player_games.each do |game|
      ganancias_muertes += game.cash
    end
    ganancias_muertes
  end

  def finanzas_games_perdidos
    perdidas = 0
    self.games.each do |game|
      perdidas += game.game_cash
    end
    perdidas
  end

  def finanzas
    finanzas_games_ganados + finanzas_muertes - finanzas_games_perdidos
  end

end
