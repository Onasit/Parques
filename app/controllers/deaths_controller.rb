class DeathsController < ApplicationController

    def create
        @death = Death.new(death_params)

        @death.save

        redirect_to in_game_game_path(@death.game)
    end

    private

    def death_params
        params.require(:death).permit(:assassin_id, :victim_id, :game_id, :soplo, :zone, :assassin_pig, :victim_pig)
    end
end 
