require 'rails_helper'

RSpec.describe Season, type: :model do

  it { should respond_to(:completed) }
  it { should respond_to(:name) }


  describe "dataanalyzer" do
    it 'returns the name for a season' do
      season = create(:season, name: "Season_name2")
      expect(season.name).to eq "Season_name2"
      expect(season.completed).to be false
    end
  end
end
