module GamesHelper
    def mensaje_final(game)
        "Partida terminada, el ganador fue #{game.winner.name} y ganó #{game.player_games.where(player_id: game.winner.id).first.winner_cash}"
    end

    def deaths_for_player(victim, assassin, game)
        Death.where(assassin_id: assassin.player.id, victim_id: victim.player.id, game_id: game.id).count
    end

    def deaths_total(assassin, game)
        Death.where(assassin_id: assassin.player.id, game_id: game.id).count
    end

    def data_game(game)
        game.created_at.strftime("%A, %d/%b/%y --%H:%M ")
    end
end
