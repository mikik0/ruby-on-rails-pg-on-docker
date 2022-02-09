class AddFinishedAtToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :finished_at, :deadline
  end
end
