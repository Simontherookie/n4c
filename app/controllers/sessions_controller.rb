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
      flash[:notice] = "Welcome, #{guest.name}!"
      redirect_to rsvp_path
    else
      flash[:error] = "Sorry, you need to email rsvp@nickandchelsea2013.com before you can log in."
      redirect_to root_path(:email => @session.email)
    end
  end

  def destroy
    session[:guest_id] = nil
    redirect_to root_path
  end

end
