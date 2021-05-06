class RenameIsFinishedColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :is_finished, :is_all_day
  end
end
