class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.boolean :finished
      t.references :list, index: true, foreign_key: true
      
      t.timestamps null: false
    end
    add_index :tasks, [:list_id, :created_at]
  end
end
