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

  def current_admin_check
    if current_user
      render_403 if current_user.admin != 1
    else
      redirect_to new_user_session_path
    end
  end

  def render_403(options={})
    render_error({:message => :notice_not_authorized, :status => 403}.merge(options))
    return false
  end

  def render_error(arg)
    arg = {:message => arg} unless arg.is_a?(Hash)
    
    @message = arg[:message]
    #@message = l(@message) if @message.is_a?(Symbol)
    @status = arg[:status] || 500
    
    respond_to do |format|
        format.html {
            render :template => 'common/error', :status => @status
        }
        format.any { head @status }
    end
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
