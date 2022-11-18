class AddDeathChange2 < ActiveRecord::Migration[6.1]
  def change
    remove_column :deaths, :assassin
    remove_column :deaths, :assasin_id
    add_column :deaths, :assassin_id, :integer, null: false
  end
end
