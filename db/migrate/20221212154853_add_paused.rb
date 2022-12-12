class AddPaused < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :paused, :boolean, default: false
  end
end
