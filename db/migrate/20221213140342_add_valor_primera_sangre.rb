class AddValorPrimeraSangre < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :first_blood_cash_victim, :integer
    add_column :games, :first_blood_cash_players, :integer
  end
end
