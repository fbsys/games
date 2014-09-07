class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private
    def make_diskfile(data)
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
    
    def delete_files(elapsed_seconds = 60*60)
      ##permission denied? -> can't unlock
      #del 1 hours elapsed (60sec*60min)
      #t = Time.now - elapsed_seconds
      #tmp_path = File.expand_path(Rails.root.to_s + "/file/" + t.strftime("%Y%m%d_%H*")).to_s
      #Dir.glob(tmp_path).each{ |f| File.delete(f.to_s)}
    end
end
