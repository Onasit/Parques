class AddNameSeason < ActiveRecord::Migration[6.1]
  def change
    add_column :seasons, :name, :string
  end
end
