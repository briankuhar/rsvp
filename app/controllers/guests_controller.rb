class GuestsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy, :new, :update_status]
  
  def index
    @event = Event.find(params[:event_id])
    @guests = @event.guests.all
  end
  
  def update_status
    @event = Event.find(params[:event_id])
    @guest = @event.guests.find(params[:id])
    
    if @guest != nil?
      if @guest.guest_status == false
        @guest.update_attributes(:guest_status => true)
      else
        @guest.update_attributes(:guest_status => false)
      end
    else
      #throw an error
    end
  end
  
  def new
    @event = Event.find(params[:event_id])
    @guest = @event.guests.new
  end

  def create
    @event = Event.find(params[:event_id])
    @guest = @event.guests.new(guest_params)
    if @guest.save
      redirect_to event_guests_path
    else
      render 'new'
    end
  end

  def destroy
    Guest.find(params[:id]).destroy
    redirect_to event_guests_path
  end
  
  private
  
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :email, :phone, :guest_status)
    end

end