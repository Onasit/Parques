class ZonaMuerte < ActiveRecord::Migration[6.1]
  def change
    add_column :deaths, :zone, :integer
    add_column :deaths, :assassin_pig, :boolean, default: false
    add_column :deaths, :victim_pig, :boolean, default: false
  end
end
