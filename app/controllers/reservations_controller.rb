class ReservationsController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @reservation = current_user.reservations.build(reservation_params)
    if current_user == @room.user
      flash[:alert] = "You can not book your own property"
    else
      if @reservation.save || reservations.any?
        flash[:success] = "Succesfully Booked!"       
      end 
    end
    redirect_to @room 
  end

  def your_trips
  
  end

  def your_reservations
  
  end

  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :room_id)
    end
end
