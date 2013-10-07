class ChangeLatAndLongToDoubles < ActiveRecord::Migration
  def change
    change_column :restaurants, :lat, :real
    change_column :restaurants, :long, :real
  end
end
