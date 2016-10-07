class EventsController < ApplicationController
  layout :resolve_layout
  
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]

  def index
    @user = current_user
    unless @user.blank?
      @events = @user.events.all
    end
  end

  def show
    @event = Event.friendly.find(params[:id])
  end
  
  def new
    @user = current_user
    @event = @user.events.new
  end
  
  def create
    @user = current_user
    @event = @user.events.new(event_params)
    @event.path = @event.event_name.gsub(/[^0-9a-z\\s]/i, '').downcase
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
    @event = Event.friendly.find(params[:id])
  end
  
  def update
    @event = Event.friendly.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end
  
  def rsvp
    @event = Event.friendly.find(params[:id])
    @guests = @event.guests.all
  end
  
  def destroy
    Event.friendly.find(params[:id]).destroy
    redirect_to root_path
  end
  
  private
  
    def event_params
      params.require(:event).permit(:event_type, :event_date, :event_name, :event_rsvp_date)
    end

    def resolve_layout
      case action_name
      when "show"
        "rsvp"
      else
        "application"
      end
    end
  
end