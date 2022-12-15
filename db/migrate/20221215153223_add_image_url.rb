class AddImageUrl < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :imagen_url, :text
  end
end
