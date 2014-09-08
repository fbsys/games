class UploadFile < ActiveRecord::Base
  has_one :badge, :class_name => 'Badge', :foreign_key => 'file_id', :dependent => :delete

    def self.make_diskfile(data)
      old_name = data.tempfile.to_path.to_s
      t = Time.now
      tmp_folder = Rails.root.to_s + "/file/"
      tmp_file = t.strftime("%Y%m%d_%H%M%S_#{t.usec.to_s[0, 3]}") + File::extname(data.original_filename).to_s
      upload_file_path = tmp_folder + tmp_file
      while File.exist?(upload_file_path) do
        tmp_file = t.strftime("%Y%m%d_%H%M%S_#{t.usec.to_s[0, 3]}_") + tmp_file
        upload_file_path = tmp_folder + tmp_file
      end
      FileUtils.copy(old_name, upload_file_path)
      return upload_file_path
    end

    def self.save_file(data)
      diskfile = self.make_diskfile(data)
      uploadfile = self.new(:filename => data.original_filename,:content_type => data.content_type,:server_path => diskfile)
      return uploadfile
    end
end
