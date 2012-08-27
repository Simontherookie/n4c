class HomeController < ApplicationController

  skip_before_filter :require_login, :only => [:index]
  
  def index
    @guest = Guest.new
  end

  def info
    @guest = current_guest
  end
  
end
