class GamesController < ApplicationController
    def index
        @games = Game.all
    end

    def new
        @game = Game.new
    end

    def create
        @game = Game.new(game_params)

        respond_to do |format|
            if @game.save
                format.html { redirect_to games_path,
                                notice: 'Game creado correctamente'}
            else
                format.html { render :new }
            end
        end
    end

    private
    
    def game_params
        params.require(:game).permit(:players, player_games_attributes: [:player_id, :_destroy])
        
    end
end
