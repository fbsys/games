class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.integer :year
      t.integer :month
      t.string :employee_num
      t.string :company_name
      t.string :employee_name
      t.string :avatar_type
      t.float :strength
      t.float :constitution
      t.float :intelligence
      t.float :magic
      t.float :agility
      t.float :charm
      t.float :luck
      t.float :potential

      t.timestamps
    end
  end
end
