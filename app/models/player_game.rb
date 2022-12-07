class PlayerGame < ApplicationRecord
  belongs_to :player
  belongs_to :game


  def cash
    death_cash = self.game.death_cash
    
    assassin_counter = Death.where(assassin_id: self.player.id, game_id: self.game_id).count
    victim_counter = Death.where(victim_id: self.player.id, game_id: self.game_id).count

    death_cash * (assassin_counter - victim_counter)
  end

  def winner_cash
    game_cash = self.game.game_cash

    game_cash * self.game.players.count
  end

end