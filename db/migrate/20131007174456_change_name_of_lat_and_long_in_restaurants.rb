class ChangeNameOfLatAndLongInRestaurants < ActiveRecord::Migration
  def change
    rename_column :restaurants, :lat, :latitude
    rename_column :restaurants, :long, :longitude
  end
end
