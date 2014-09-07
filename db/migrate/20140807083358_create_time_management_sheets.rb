class CreateTimeManagementSheets < ActiveRecord::Migration
  def change
    create_table :time_management_sheets do |t|
      t.integer :year, :null => false, :limit => 4
      t.integer :month, :null => false, :limit => 2
      t.string :employee_num, :null => false
      t.string :company_name, :null => false
      t.string :department_code, :null => false
      t.string :instruction_id, :null => false
      t.string :team_code, :null => false
      t.string :work_task_id, :null => false
      t.string :work_process_id, :null => false
      t.float :man_hour, :null => false

      t.timestamps
    end
  end
end
