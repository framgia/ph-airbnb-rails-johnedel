class RoomsController < ApplicationController

  before_action :authenticate_user!
  
  def index
  end

  def new
    @room = current_user.rooms.build
  end

  def show
    @room = Room.find(params[:id])
    @photos = @room.photos
    @reservation = Reservation.new
    @reviews = @room.reviews.where.not(host_id: current_user)
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = "Saved"
      redirect_to listing_room_path(@room)
    else
      flash[:alert] = "Please complete all fields"
      render 'new'
    end
  end

  def update 
    @room = Room.find(params[:id])    
    begin
      if @room.update(room_params)
        flash[:notice] = "Saved..."
      else
        flash[:alert] = "Something went wrong..."
      end
      redirect_to request.referrer
    rescue
      @room.update_attribute(:is_active, true)
      flash[:notice] = "Successfully Published"
      redirect_to request.referrer
    end
  end

  def listing
    @room = Room.find(params[:id])
  end

  def price
    @room = Room.find(params[:id])
  end

  def description
    @room = Room.find(params[:id])
  end

  def photos
    @room = Room.find(params[:id])
    @photos = @room.photos
    @photo = Photo.new
  end

  def amenities
    @room = Room.find(params[:id])
  end

  def location
    @room = Room.find(params[:id])
  end

  private
  def room_params 
    params.require(:room).permit(:home_type, :room_type, :accommodate, :bedrooms, :bathrooms, :price, :listing_name,
    :summary, :is_tv, :is_kitchen, :is_internet, :is_heating, :is_air, :address, :is_active)
  end
end
