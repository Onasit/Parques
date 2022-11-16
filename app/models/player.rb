class Player < ApplicationRecord
  
  has_many :player_games
  has_many :games, through: :player_games

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
