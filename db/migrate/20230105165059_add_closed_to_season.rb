class AddClosedToSeason < ActiveRecord::Migration[6.1]
  def change
    add_column :seasons, :completed, :boolean, default: false
  end
end
