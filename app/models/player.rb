class Player < ApplicationRecord
  
  has_many :player_games
  has_many :games, through: :player_games
  has_many :won_games, class_name: "Game", foreign_key: "player_id"
  has_many :seasons

  mount_uploader :image, PlayerUploader


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  
  
  def deaths_from_season(deaths, season)
    deaths.select {|d| season.games.pluck(:id).include?(d.game_id) }
  end
  
  def assassin_counter_in_season(season)
    @deaths = Death.where(assassin_id: self.id)
    deaths_from_season(@deaths, season).count
  end

  def victim_counter_in_season(season)
    @deaths = Death.where(victim_id: self.id)
    deaths_from_season(@deaths, season).count
  end

  def won_games_for_season(season)
    self.won_games.where(season_id: season.id)
    
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


  def verdugos(season)
    verdugos = []
    Death.where(victim_id: self.id).each do |muertes|
      verdugos.push(muertes.assassin.name) if season.games.include?(muertes.game)
    end

    verdugos_hash = Hash.new(0)

    verdugos.each do |asesino|
      verdugos_hash[asesino] += 1
    end

    verdugos_hash.sort_by{|verdugo, muertes| muertes}.reverse.to_h
  end

  def presas(season)
    presas = []
    Death.where(assassin_id: self.id).each do |muertes|
      presas.push(muertes.victim.name) if season.games.include?(muertes.game)
    end

    presas_hash = Hash.new(0)

    presas.each do |victima|
      presas_hash[victima] += 1
    end

    presas_hash.sort_by{|presa, muertes| muertes}.reverse.to_h
  end


  def soplos_in_season(season)
    Death.where(victim_id: self.id, soplo: true)
    deaths_from_season(@deaths, season).count
  end

end
