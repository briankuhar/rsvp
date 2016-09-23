class GuestsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy, :new]
  
  def index
    @event = Event.find(params[:event_id])
    @guests = @event.guests.all
  end
  
  def show
  end
  
  def edit
    
  end
  
  def update
  end
  
  def update_status
    
    respond_to do |format|
      if guest.update_attributes(params[:guest])
        format.html { redirect_to event_guests_path, notice: 'Guest updated successfully' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: guest.errors, status: :unprocessable_entity }
      end
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
      params.require(:guest).permit(:first_name, :last_name, :email, :phone)
    end

end