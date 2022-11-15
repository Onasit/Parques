class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :primero_en_matar
      t.string :primero_em_morir
      t.string :primero_en_salir
      t.string :ultimo_en_salir
      t.references :player, foreign_key: true
      t.datetime :date_and_time
      t.boolean :paused

      t.timestamps
    end
  end
end
