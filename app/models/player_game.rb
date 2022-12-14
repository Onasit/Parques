class PlayerGame < ApplicationRecord
  belongs_to :player
  belongs_to :game

  def cash
    death_cash = self.game.death_cash
    first_blood_victim_cash = self.game.first_blood_cash_victim.to_i
    first_blood_player_cash = self.game.first_blood_cash_players.to_i
    cash_first_blood = 0
    first_deaths = self.game.deaths.first_blood.first
    
    assassin_counter = Death.where(assassin_id: self.player.id, game_id: self.game_id, first_blood: false).count
    victim_counter = Death.where(victim_id: self.player.id, game_id: self.game_id, first_blood: false).count

    case 
    when first_deaths&.assassin_id == self.player.id
      cash_first_blood = first_blood_victim_cash + first_blood_player_cash * (self.game.players.count - 2)
    
    when first_deaths&.victim_id == self.player.id
      
      cash_first_blood = -first_blood_victim_cash
    else
      cash_first_blood = -first_blood_player_cash
    end
    


    death_cash * (assassin_counter - victim_counter) + cash_first_blood
  end

   

  def winner_cash
    game_cash = self.game.game_cash

    game_cash * self.game.players.count
  end

end