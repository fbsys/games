class CreateBadgeConditions < ActiveRecord::Migration
  def change
    create_table :badge_conditions do |t|
      t.integer :badge_id
      t.string :condition
      t.integer :pass_num
      t.timestamps
    end
  end
end
