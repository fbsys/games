class ChangeColumnUploadFile < ActiveRecord::Migration
  def change
    add_column :upload_files, :disk_fullpath, :text
    rename_column :upload_files, :server_path, :disk_filename
  end
end
