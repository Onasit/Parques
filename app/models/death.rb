class Death < ApplicationRecord
  belongs_to :assasin, class_name: "Player"
  belongs_to :victim, class_name: "Player"
end
