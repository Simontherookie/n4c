class GiftsController < ApplicationController
  
  def index
    @gifts_by_category = Gift.gifts_by_category
    @dibsed = Gift.where(:guest => current_guest)
  end

  def update
    @gift = Gift.find_by_id(params[:id])

    if @gift.guest
      if @gift.guest.eql?(current_guest)
        #undibs
        flash[:warning] = "You are no longer gifting us '#{@gift.name}'!"
        @gift.guest = nil
      else
        flash[:error] = "Sorry, that gift has already been dibsed."
      end
    else
      flash[:notice] = "Thanks for gifting us '#{@gift.name}'!"
      @gift.guest = current_guest
    end
    
    @gift.save!
    redirect_to gifts_path
  end


end
