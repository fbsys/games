class UploadFile < ActiveRecord::Base
  after_destroy :delete_from_disk

    def self.make_diskfile(data, disk_folder="/file/")
      old_name = data.tempfile.to_path.to_s
      t = Time.now
      tmp_folder = Rails.root.to_s + disk_folder
      tmp_file = t.strftime("%Y%m%d%H%M%S#{t.usec.to_s[0, 3]}") + File::extname(data.original_filename).to_s
      upload_file_path = Hash[:full_path => tmp_folder + tmp_file, :folder_path => tmp_folder, :file_name => tmp_file]
      while File.exist?(upload_file_path[:full_path]) do
          tmp_file = t.strftime("%Y%m%d%H%M%S#{t.usec.to_s[0, 3]}") + tmp_file
          upload_file_path = Hash[:full_path => tmp_folder + tmp_file, :folder_path => tmp_folder, :file_name => tmp_file]
      end
      FileUtils.move(old_name, upload_file_path[:full_path])
      return upload_file_path
    end

    def self.save_badge_icon(data, disk_folder="/app/assets/images/")
      diskfile = self.make_diskfile(data, disk_folder)
uploadfile = self.new(:filename => data.original_filename,:content_type => data.content_type, :disk_filename => diskfile[:file_name], :disk_fullpath => diskfile[:full_path])
      return uploadfile
    end

    private
    def delete_from_disk
        if disk_fullpath.present? && File.exist?(disk_fullpath)
            File.delete(disk_fullpath)
        end
    end

end
