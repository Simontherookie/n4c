class GuestsController < ApplicationController
  
  skip_before_filter :require_login, :only => [:create]
  
  def create
    @guest = Guest.new(params[:guest])

    respond_to do |format|
      if @guest.save
        format.json { render json: @guest, status: :created }
      else
        format.js { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    guest = current_guest

    guest.rsvp_wedding = params[:guest][:rsvp_wedding]
    guest.rsvp_reception = params[:guest][:rsvp_reception] && guest.going_to_reception?
    guest.rsvp_bbq = params[:guest][:rsvp_bbq]

    if guest.save
      head :ok
    else
      head 422
    end
  end

end
