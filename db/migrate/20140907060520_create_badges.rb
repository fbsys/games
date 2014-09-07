class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :description
      t.string :badge_type
      t.integer :file_id
      t.integer :badge_category_id
      t.timestamps
    end
  end
end
