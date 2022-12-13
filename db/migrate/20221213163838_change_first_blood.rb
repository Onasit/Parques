class ChangeFirstBlood < ActiveRecord::Migration[6.1]
  def change
    change_column :games, :first_blood_cash_victim, :integer, default: 0
    change_column :games, :first_blood_cash_players, :integer, default: 0
  end
end