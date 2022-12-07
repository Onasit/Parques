class DeathsController < ApplicationController

    def create
        @death = Death.new(death_params)
        
        respond_to do |format|
            if @death.save
                format.html { redirect_to in_game_game_path(@death.game),
                                notice: "Muerte añadida"}
                else
                    format.html { redirect_to in_game_game_path(@death.game), notice: @death.errors.full_messages.to_sentence }
            end
        end
    end

    private

    def death_params
        params.require(:death).permit(:assassin_id, :victim_id, :game_id, :soplo, :assassin_pig, :victim_pig)
    end
end 
