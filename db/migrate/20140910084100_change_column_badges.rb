class ChangeColumnBadges < ActiveRecord::Migration
  def change
    rename_column :badges, :file_id, :upload_file_id
  end
end
