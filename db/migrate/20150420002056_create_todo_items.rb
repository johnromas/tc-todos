class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.date :due_date
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
