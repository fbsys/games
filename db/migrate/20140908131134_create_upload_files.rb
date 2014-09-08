class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|
      t.string :filename
      t.string :content_type
      t.string :server_path

      t.timestamps
    end
  end
end
