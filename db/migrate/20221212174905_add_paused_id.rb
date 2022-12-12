class AddPausedId < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :pauser_id, :integer
  end
end
