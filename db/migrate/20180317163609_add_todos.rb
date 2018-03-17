class AddTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string   :title, null: false
      t.datetime :completed_at

      t.timestamps
    end
  end
end
