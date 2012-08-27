class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  def require_login
    redirect_to new_session_path unless current_guest
  end

  def current_guest
    @_current_guest ||= Guest.find_by_id(session[:guest_id])
  end
  helper_method :current_guest

end
