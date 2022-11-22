class AddCash < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :death_cash, :integer
    add_column :games, :game_cash, :integer

    Game.all.update_all(death_cash: 300, game_cash: 5000)

    change_column :games, :game_cash, :integer, null: false
    change_column :games, :death_cash, :integer, null: false
  end
end
