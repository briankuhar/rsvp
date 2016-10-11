class PartiesController < ApplicationController
  
  def index
  end  
  
  def new
    @event = Event.friendly.find(params[:event_id])
    @party = @event.parties.new
    10.times {@party.guests.build}
  end
  
  def create
    @event = Event.friendly.find(params[:event_id])
    @party = @event.parties.new(party_params)
    if @party.save
      redirect_to event_guests_path(@event)
    else
      render 'new'
    end
  end
  
  
  private
  
    def party_params
      params.require(:party).permit(:id, :party_name, guests_attributes: [:event_id, :id, :first_name, :last_name, :email, :phone])
    end
end