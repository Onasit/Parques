class RemovePlayerId < ActiveRecord::Migration[6.1]
  def change
    remove_column :deaths, :player_id
  end
end
