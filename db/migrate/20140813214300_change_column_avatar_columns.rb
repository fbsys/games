class ChangeColumnAvatarColumns < ActiveRecord::Migration
  def change
    remove_column :avatars, :year, :integer
    remove_column :avatars, :month, :integer
    add_column :avatars, :dates, :text
  end
end
