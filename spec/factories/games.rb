FactoryBot.define do
  factory :game do
    death_cash { 300 }
    game_cash { 5000 }
    season
    first_blood_cash_victim { 1000 }
    first_blood_cash_players { 500 }
    paused { false}

    factory :game_with_players do
      transient do
        player_games_count { 5 }
      end

      after(:build) do |game, evaluator|
        build_list(:player_game, evaluator.player_games_count, game: game)
        game.season.save
      end
    end
  end
  
end
