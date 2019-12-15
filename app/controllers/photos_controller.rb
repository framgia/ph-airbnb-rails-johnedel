class PhotosController < ApplicationController

  def create
    @room =  Room.find(params[:photo][:room_id])
    if @room
      if params[:images]
        params[:images].each { |image| @room.photos.create(image: image) }
      end
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @room = @photo.room
    @photo.destroy
    @photos = Photo.where(room_id: @room.id)
    respond_to :js
  end
end