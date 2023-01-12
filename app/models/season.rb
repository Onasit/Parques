class Season < ApplicationRecord
    has_many :games
    belongs_to :player, optional: true
end
