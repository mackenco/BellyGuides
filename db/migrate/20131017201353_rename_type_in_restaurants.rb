class RenameTypeInRestaurants < ActiveRecord::Migration
  def change
    rename_column :restaurants, :type, :place_type
  end
end
