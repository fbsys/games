class CreateBadgeLogs < ActiveRecord::Migration
  def change
    create_table :badge_logs do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.integer :badge_id
      t.string :description
      
      t.timestamps
    end
  end
end
