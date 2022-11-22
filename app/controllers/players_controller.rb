class PlayersController < ApplicationController
    before_action :set_player, only: [:show]


    def index
        @players = Player.all
    end

    def show
       
    end
    def score
        @players = Player.all.sort_by{|e| e.won_games.count}.reverse
        #@players = Player.all.order() -- ordenar por un atributo
    end

    private
    def set_player
        @player = Player.find(params[:id])
    end

end
