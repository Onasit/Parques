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
end
