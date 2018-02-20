class DropTypesTable < ActiveRecord::Migration
  def change
    remove_column :lists, :type_id
    drop_table :types
  end
end
