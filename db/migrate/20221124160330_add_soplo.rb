class AddSoplo < ActiveRecord::Migration[6.1]
  def change
    add_column :deaths, :soplo, :boolean, default: false
  end
end
