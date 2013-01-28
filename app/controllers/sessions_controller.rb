class SessionsController < ApplicationController
  
  skip_before_filter :require_login

  def new
    session[:guest_id] = nil
    flash[:error] = "Sorry, this website is now closed."
    redirect_to root_path
  end

  def create
    session[:guest_id] = nil
    flash[:error] = "Sorry, this website is now closed."
    redirect_to root_path
  end

  def destroy
    session[:guest_id] = nil
    redirect_to root_path
  end

end
