class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.boolean :finished
      t.references :user, index: true, foreign_key: true
      t.references :type, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :lists, [:user_id, :created_at]
    add_index :lists, [:type_id, :created_at]
  end
end
