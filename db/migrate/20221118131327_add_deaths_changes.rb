class AddDeathsChanges < ActiveRecord::Migration[6.1]
  def change
    remove_column :deaths, :assasin if ActiveRecord::Base.connection.column_exists?(:deaths, :assasin)
    remove_column :deaths, :victim if ActiveRecord::Base.connection.column_exists?(:deaths, :victim)
    add_column :deaths, :assasin_id, :integer, null: false unless ActiveRecord::Base.connection.column_exists?(:deaths, :assasin_id)
    add_column :deaths, :victim_id, :integer, null: false unless ActiveRecord::Base.connection.column_exists?(:deaths, :victim_id)
    add_column :deaths, :first_blood, :boolean, default: false
  end
end
