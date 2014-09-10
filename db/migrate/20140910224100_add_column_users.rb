class AddColumnUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :integer, default: 0
    add_column :users, :name, :text, default: ""
    add_column :users, :employee_id, :text
  end
end
