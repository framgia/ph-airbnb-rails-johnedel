class PhotosController < ApplicationController

  def create
    @room =  Room.find(params[:photo][:room_id])
    if @room
      if params[:images]
        params[:images].each { |image| @room.photos.create(image: image) }
      end
      flash[:success] = "Saved..."
      redirect_to request.referrer
    end
  end

  def destroy
    @photo = Photo.find(params[:id]).destroy
    flash[:success] = "Photo Deleted"
    redirect_to request.referrer
  end
end