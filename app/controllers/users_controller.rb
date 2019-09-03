class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms
    #review type value 1 is equal to 
    @guests = Review.where(host_id: @user.id).where(review_type: 1)
    @hosts = Review.where(guest_id: @user.id).where(review_type: 0)
  end
end
