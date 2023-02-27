require 'rails_helper'

RSpec.describe Player, type: :model do

  describe "dataanalyzer" do
    it 'returns the name for a player' do
      player = create(:player)
      expect(player.name).to eq "Nombre"
    end
  end
end
