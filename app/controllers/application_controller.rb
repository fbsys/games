class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private    
    def delete_files(elapsed_seconds = 60*60)
      ##permission denied? -> can't unlock
      #del 1 hours elapsed (60sec*60min)
      #t = Time.now - elapsed_seconds
      #tmp_path = File.expand_path(Rails.root.to_s + "/file/" + t.strftime("%Y%m%d_%H*")).to_s
      #Dir.glob(tmp_path).each{ |f| File.delete(f.to_s)}
    end
end
