class EventsController < ApplicationController
  
  def index
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @user = current_user
    @event = @user.events.new
  end
  
  def create
    @user = current_user
    @event = @user.events.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
    def event_params
      params.require(:event).permit(:event_type, :event_date)
    end
  
end