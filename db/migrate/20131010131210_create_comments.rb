class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :owner_id
      t.integer :map_id
      t.text :text

      t.timestamps
    end
    add_index :comments, :owner_id
    add_index :comments, :map_id
  end
end
