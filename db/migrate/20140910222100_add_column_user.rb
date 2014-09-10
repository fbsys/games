class AddColumnUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :integer
    add_column :users, :name, :text
    add_column :users, :employee_id, :text
  end
end
