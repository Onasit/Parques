class GamesController < ApplicationController

    before_action :set_game, only: [:in_game, :show, :update]
    
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
                format.html { redirect_to in_game_game_path(@game),
                                notice: 'Game creado correctamente'}
            else
                format.html { render :new }
            end
        end
    end

    def update 
        if @game.update(game_params)
            redirect_to games_path, notice:"Juego guardado"
        else
            render :in_game
        end
    end
    
    def show
        @deaths = @game.deaths
    end

    def in_game

            @death =  Death.new(game_id: @game.id)
            #@death = @game.deaths.build
            @deaths = @game.deaths
    end

    private

    def set_game
        @game = Game.find(params[:id])
    end
    
    def game_params
        params.require(:game).permit(:players, :player_id, :death_cash, :game_cash, player_games_attributes: [:player_id, :_destroy])
        
    end
end
