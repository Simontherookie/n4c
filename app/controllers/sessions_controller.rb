class SessionsController < ApplicationController
  
  skip_before_filter :require_login

  def new
    #Log them out
    session[:guest_id] = nil
    
    @session = Session.new(:email=>params[:email].try(:downcase))
  end

  def create
    @session = Session.new(params[:session])
    if guest = @session.guest
      session[:guest_id] = guest.id
      redirect_to info_path
    else
      flash[:error] = "Sorry! Please email us to RSVP."
      redirect_to root_path(:email => @session.email)
    end
  end

  def destroy
    session[:guest_id] = nil
    redirect_to root_path
  end

end
