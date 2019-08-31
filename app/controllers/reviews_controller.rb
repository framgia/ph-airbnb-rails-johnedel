class ReviewsController < ApplicationController
  def create	
    host_params = current_user.active_relationships.create(review_params)
    guest_params = current_user.passive_relationships.create(review_params)

     if host_params.save or guest_params.save
      flash[:success] = "Review created"
    else
      flash[:alert] = "Something went wrong... "
    end
    redirect_to request.referrer
  end

   private
    def review_params
      params.require(:review).permit(:comment, :star, :room_id, :reservation_id, :host_id, :guest_id)
    end
end