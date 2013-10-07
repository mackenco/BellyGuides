class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.boolean :completed
      t.text :note
      t.string :source_url
      t.integer :map_id
      t.integer :lat
      t.integer :long

      t.timestamps
    end
    add_index :restaurants, :map_id
  end
end
