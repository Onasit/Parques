class GamesController < ApplicationController

    before_action :set_game, only: [:in_game, :update, :estado]

    
    def new
        @game = Game.new
    end
    
    def create
        @game = Game.new(game_params)
        season = Season.where(completed: false).first
        @game.season = season
        
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
            redirect_to in_game_game_path(@game), notice:"Juego guardado"
        else
            render :in_game
        end
    end
    
    def in_game
        @death =  Death.new(game_id: @game.id)
        @deaths = @game.deaths
        #@death = @game.deaths.build
            
    end

    def estado
        
        @game.paused = !@game.paused
        if @game.paused == true
            @game.pauser_id = current_player.id
        else
            @game.pauser_id = nil
        end
        @game.save


        redirect_to in_game_game_path(@game)
    end

    private

    def set_game
        @game = Game.find(params[:id])
    end
    
    def game_params
        params.require(:game).permit(:players, :player_id, :death_cash, :game_cash, :first_blood_cash_victim, :first_blood_cash_players, player_games_attributes: [:player_id, :_destroy])
        
    end
end
