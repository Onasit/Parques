class Death < ApplicationRecord
  belongs_to :player
  belongs_to :victima, class_name: "Player"
end
