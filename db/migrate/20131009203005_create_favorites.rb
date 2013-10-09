class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :map_id

      t.timestamps
    end
    add_index :favorites, :user_id
    add_index :favorites, :map_id
    add_index :favorites, [:user_id, :map_id]
  end
end
