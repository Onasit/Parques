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

  def verdugos
    verdugos = []
    Death.where(victim_id: self.id).each do |muertes|
      verdugos.push(muertes.assassin.name)
    end

    verdugos_hash = Hash.new(0)

    verdugos.each do |asesino|
      verdugos_hash[asesino] += 1
    end

    verdugos_hash.sort_by{|verdugo, muertes| muertes}.reverse.to_h
  end

  def presas
    presas = []
    Death.where(assassin_id: self.id).each do |muertes|
      presas.push(muertes.victim.name)
    end

    presas_hash = Hash.new(0)

    presas.each do |victima|
      presas_hash[victima] += 1
    end

    presas_hash.sort_by{|presa, muertes| muertes}.reverse.to_h
  end

  def racha_victorias
    contador = 0
    racha_maxima = 0
    Game.pluck(:player_id). each do |ganador_id|
      if self.id == ganador_id
        contador = contador + 1
        if contador > racha_maxima
          racha_maxima = contador
        end
      else 
        contador = 0
      end
    end
      racha_maxima
  end



end
