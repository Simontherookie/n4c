class Admin::GuestsController < Admin::BaseController
  
  def index
    @guests = Guest.order("going_to_reception DESC, name ASC")
  end

  def create
    @guest = Guest.create(params[:guest])
    redirect_to admin_guests_path
  end

  def update
    @guest = Guest.find(params[:id])
    @guest.going_to_reception = params[:guest][:going_to_reception]

    if @guest.save
      head :ok
    else
      head :unprocessable_entity
    end
  end

end
