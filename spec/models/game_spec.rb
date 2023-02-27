require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should belong_to(:season) }
  it { should have_many(:player_games)}
  it { should have_many(:players) }
  it { should have_many(:deaths) }


  describe "#save" do

    context 'with params from FactoryBot' do
      let(:player_games_count) {4}
      subject(:game) {build(:game_with_players, player_games_count: player_games_count)}

      it 'is persisted' do
        expect(game.save).to eq true
      end
      
      context 'after save' do
        before(:each) {game.save}
        
        it 'returns player_games count' do
          expect(game.players.length).to eq 5
        end

        # it 'non-repeated players' do
        #   create(:player_game, player: game.players.sample, game: game)
        #   expect(game.players.length).to_not eq 6
        # end

        context 'completed game' do
          it 'returns winner' do
            game.update!(player_id: game.players.first.id)
            expect(game.winner).to eq game.players.first
          end
        end

      end

    end

  end
  
end



