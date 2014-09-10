class RemoveColumnUser < ActiveRecord::Migration
  def change
    remove_column :users, :admin, :integer
    remove_column :users, :name, :text
    remove_column :users, :employee_id, :text
  end
end
