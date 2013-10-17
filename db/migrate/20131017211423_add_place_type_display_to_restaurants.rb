class AddPlaceTypeDisplayToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :place_type_display, :string
  end
end
