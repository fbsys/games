class ChangeColumnWorkTasks < ActiveRecord::Migration
  def change
    rename_column :work_tasks, :task_code, :short_task_code
  end
end
