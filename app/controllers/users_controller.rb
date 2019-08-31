class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rooms = Room.where(user_id: @user)
    @guests = Review.where(host_id: @user) 
    @hosts = Review.where(guest_id: @user)
    @room = Room.find(params[:id])
    @reviews = Review.where(room_id: @room)
  end
end
