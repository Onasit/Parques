class Player < ApplicationRecord
  
  has_many :player_game
  has_many :games, through: :player_game

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
