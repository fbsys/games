class CreateWorkProcesses < ActiveRecord::Migration
  def change
    create_table :work_processes do |t|
      t.string :process_code
      t.string :status_type
      t.string :name

      t.timestamps
    end
  end
end
