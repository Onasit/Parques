class AddDeathsChanges < ActiveRecord::Migration[6.1]
  def change
    remove_column :deaths, :assasin
    remove_column :deaths, :victim
    add_column :deaths, :assasin_id, :integer, null: false
    add_column :deaths, :victim_id, :integer, null: false
    add_column :deaths, :first_blood, :boolean, default: false
  end
end
