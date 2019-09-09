class StaticPagesController < ApplicationController
  def home
    @search = Room.ransack(params[:q])
    @rooms = @search.result
    @allRooms = Room.where(is_active: true).limit(3)
  end

  def map
  end
end
