class AddStatusToTodos < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :status, :string
  end
end