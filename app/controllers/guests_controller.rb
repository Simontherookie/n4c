class GuestsController < ApplicationController
  
  skip_before_filter :require_login
  
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
end
