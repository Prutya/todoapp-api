class AddReferenceToTodoGroups < ActiveRecord::Migration[5.1]
  def change
    add_reference :todo_groups, :user, foreign_key: true
  end
end
