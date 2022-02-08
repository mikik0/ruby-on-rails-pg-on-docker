class RenameCompletedAtColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :completed_at, :deadline
  end
end
