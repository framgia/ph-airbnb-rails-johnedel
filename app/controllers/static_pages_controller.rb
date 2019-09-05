class StaticPagesController < ApplicationController
  def home
    @search = Room.ransack(params[:q])
    @rooms = @search.result
  end

  def map
  end
end
