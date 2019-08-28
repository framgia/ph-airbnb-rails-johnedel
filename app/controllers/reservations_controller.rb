class ReservationsController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @reservation = current_user.reservations.build(reservation_params)
    if current_user == @room.user
      flash[:alert] = "You can not book your own property"
    else
      if @reservation.save
        flash[:success] = "Succesfully Booked!"
      else
        flash[:alert] = "Something went wrong..."
      end 
    end
    redirect_to @room 
  end

  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :price, :total, :room_id)
    end
end
