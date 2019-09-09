class SearchController < ApplicationController
  def search

    @search = Room.where(is_active: true).ransack(params[:q])
    @rooms = @search.result
    @roomss = @rooms.to_a
    @room = @roomss.first
    @address =  params[:q][:address_cont]
    
    begin
    @start_date = Date.parse(params[:start_date])
    @end_date = Date.parse(params[:end_date])
      @rooms.each do |room|
        taken_room = room.reservations.where("(? <= start_date AND start_date <= ?) OR (? <= end_date AND end_date <= ?)",
          @start_date, @end_date,
          @start_date, @end_date)
        if taken_room.any?
          @roomss.delete(room)
        end
      end
    rescue
    end
  end
end