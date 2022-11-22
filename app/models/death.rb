class Death < ApplicationRecord
  belongs_to :assassin, class_name: "Player", foreign_key: "assassin_id"
  belongs_to :victim, class_name: "Player", foreign_key: "victim_id"
  belongs_to :game

  before_save :check_first_blood

  def check_first_blood
    if game.deaths.blank?
      self.first_blood = true
    end
  end
end

