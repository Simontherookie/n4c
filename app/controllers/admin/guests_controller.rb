class Admin::GuestsController < Admin::BaseController
  
  def index
    @guests = Guest.order("going_to_reception DESC, name ASC")
  end

  def update
    @guest = Guest.find(params[:id])
    @guest.going_to_reception ||= params[:guest][:going_to_reception]

    if @guest.save
      head :ok
    else
      head :unprocessable_entity
    end
  end

end
