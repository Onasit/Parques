class PlayerMailer < ApplicationMailer
  def finish_game_email
    @player = params[:player]
    @game = params[:game]
    @winner = Player.find(@game.player_id)
    mail to: @player.email, subject: 'Juego terminado'
  end
end
