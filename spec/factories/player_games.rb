FactoryBot.define do
  factory :player_game do
    association :player

    after(:build) do |player_game, _|
      player_game.player.save
    end
  end

end
