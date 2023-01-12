class SeasonsController < ApplicationController
    before_action :set_season, only: [:show]

    def index
        @seasons = Season.all
    end

    def show
        @games = @season.games
        
        @players = Player.all.sort_by{|e| 
            e.won_games.where(season_id: @season.id).count
        }.reverse
    end

    private
    def set_season
        @season = Season.find(params[:id])
    end

end
