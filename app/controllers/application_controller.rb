class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:account_update) << :name
  end
  
  private    
    def delete_files(elapsed_seconds = 60*60)
      ##permission denied? -> can't unlock
      #del 1 hours elapsed (60sec*60min)
      #t = Time.now - elapsed_seconds
      #tmp_path = File.expand_path(Rails.root.to_s + "/file/" + t.strftime("%Y%m%d_%H*")).to_s
      #Dir.glob(tmp_path).each{ |f| File.delete(f.to_s)}
    end
end
