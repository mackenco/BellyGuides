class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.integer :owner_id, null:false
      t.string :title, null:false

      t.timestamps
    end
    add_index :maps, :owner_id
  end
end
