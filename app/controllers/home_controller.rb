class HomeController < ApplicationController
  
  def index
    @guest = Guest.new
  end
  
end
