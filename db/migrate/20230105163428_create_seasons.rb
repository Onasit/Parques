class CreateSeasons < ActiveRecord::Migration[6.1]
  def change
    create_table :seasons do |t|
      t.integer :prize
      t.integer :player_id
      t.timestamps
    end

    add_column :games, :season_id, :integer
  end
end
