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

    if params[:guest]
      guest.rsvp_wedding = params[:guest][:rsvp_wedding].eql?("true")
      if guest.going_to_reception?
        guest.rsvp_reception = params[:guest][:rsvp_reception].eql?("true")
      end
      guest.rsvp_bbq = params[:guest][:rsvp_bbq].eql?("true")
    end

    if guest.save
      flash[:notice] = "Thanks! Your RSVP has been saved."
      redirect_to rsvp_path
    else
      redirect_to rsvp_path, "Sorry, your RSVP was not saved"
    end
  end

end
