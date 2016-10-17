class SearchController < ApplicationController
  
  def search
    if params[:q].nil?
    @event = Event.friendly.find(params[:event_id])
      @guests = []
    else
    @event = Event.friendly.find(params[:event_id])
      @guests = @event.guests.search params[:q]
    end
  end
end
