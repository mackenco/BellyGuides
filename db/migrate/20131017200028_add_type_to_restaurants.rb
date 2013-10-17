class AddTypeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :type, :string
  end
end
