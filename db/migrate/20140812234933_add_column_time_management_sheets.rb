class AddColumnTimeManagementSheets < ActiveRecord::Migration
  def change
    add_column :time_management_sheets, :avatar_id, :integer
  end
end
