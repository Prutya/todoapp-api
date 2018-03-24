class AddTodoGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_groups do |t|
      t.string :title, null: false
      t.timestamps
    end

    change_table :todos do |t|
      t.references :todo_group, index: true
    end
  end
end
