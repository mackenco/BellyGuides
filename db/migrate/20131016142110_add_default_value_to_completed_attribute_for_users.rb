class AddDefaultValueToCompletedAttributeForUsers < ActiveRecord::Migration
  def change
    change_column :restaurants, :completed, :boolean, default: false
  end
end
