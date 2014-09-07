class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :instruction_code
      t.string :status_type
      t.string :name

      t.timestamps
    end
  end
end
