class PartiesController < ApplicationController
  
  def new
    @event = Event.find(params[:event_id])
    @party = @event.parties.new
    @party.guests.build
  end
  
  def create
    @event = Event.find(params[:event_id])
    @party = @event.parties.new(party_params)
    if @party.save
      redirect_to event_guests_path(@event)
    else
      @party.errors.full_messages.each do |message|
        puts message
      end
      render 'new'
    end
  end
  
  
  private
  
    def party_params
      params.require(:party).permit(:id, :party_name, guests_attributes: [:event_id, :id, :first_name, :last_name, :email, :phone])
    end
end