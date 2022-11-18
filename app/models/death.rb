class Death < ApplicationRecord
  belongs_to :assassin, class_name: "Player", foreign_key: "assassin_id"
  belongs_to :victim, class_name: "Player", foreign_key: "victim_id"
  belongs_to :game
end
