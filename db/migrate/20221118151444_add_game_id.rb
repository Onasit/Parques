class AddGameId < ActiveRecord::Migration[6.1]
  def change
    add_column :deaths, :game_id, :integer, null: false
  end
end
