class CreateWorkTasks < ActiveRecord::Migration
  def change
    create_table :work_tasks do |t|
      t.string :task_code
      t.string :status_type
      t.string :name

      t.timestamps
    end
  end
end
