class AddUserReferencesToTodoItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :todo_items, :user, foreign_key: true
  end
end
