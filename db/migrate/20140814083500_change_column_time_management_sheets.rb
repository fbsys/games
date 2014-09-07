class ChangeColumnTimeManagementSheets < ActiveRecord::Migration
  def change
    add_column :time_management_sheets, :task_code, :text
  end
end
