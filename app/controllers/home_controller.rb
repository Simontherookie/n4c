class HomeController < ApplicationController

  skip_before_filter :require_login, :only => [:index]
  
  def index
    @session = Session.new(:email=>params[:email].try(:downcase))
  end

  def info
  end
  
end
