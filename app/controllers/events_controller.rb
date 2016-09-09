class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]

  def index
    @user = current_user
    unless @user.blank?
      @events = @user.events.all
    end
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
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end
  
  def destroy
    Event.find(params[:id]).destroy
    redirect_to root_path
  end
  
  private
  
    def event_params
      params.require(:event).permit(:event_type, :event_date)
    end

  
end