class GiftsController < ApplicationController
  
  def index
    @gifts = Gift.ungifted
    @dibsed = Gift.where(:guest => current_guest)
  end

  def update
    @gift = Gift.find_by_id(params[:id])

    if @gift.guest
      flash[:error] = "Sorry, that gift has already been dibsed."
    else
      flash[:notice] = "Thanks for getting us '#{@gift.name}'!"
      @gift.guest = current_guest
      @gift.save!
    end
    redirect_to gifts_path
  end


end
