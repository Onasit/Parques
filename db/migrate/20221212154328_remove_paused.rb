class RemovePaused < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :paused
    remove_column :games, :primero_en_matar
    remove_column :games, :primero_em_morir
    remove_column :games, :primero_en_salir
    remove_column :games, :ultimo_en_salir

  end
end

