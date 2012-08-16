class Admin::GuestsController < Admin::BaseController
  
  def index
    @guests = Guest.all
  end

end
