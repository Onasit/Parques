class Death < ApplicationRecord
  belongs_to :assassin, class_name: "Player", foreign_key: "assassin_id"
  belongs_to :victim, class_name: "Player", foreign_key: "victim_id"
  belongs_to :zone_death, class_name: "Player", foreign_key: "zone"
  belongs_to :game

  before_save :check_first_blood

  validate :auto_kill

  validate :soplo_cochinas
  
  scope :first_blood, -> { where(first_blood: true) }

  def check_first_blood
    if game.deaths.blank?
      self.first_blood = true
    end
  end

  private

  def auto_kill
    if self.assassin == self.victim
      self.errors.add(:base, "Entre tanto topo ninguno te dijo?!")
    end
  end

  def soplo_cochinas
    if soplo? && victim_pig?
      self.errors.add(:base, "No puedes soplar cochinas")
    end
  end

end

