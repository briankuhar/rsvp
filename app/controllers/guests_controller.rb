class GuestsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy, :new, :update_status, :meal_selection]
  
  def index
    @event = Event.friendly.find(params[:event_id])
    if params[:keywords].present?
      @keywords = params[:keywords]
      customer_search_term = GuestSearchTerm.new(@keywords)
      @guests = @event.guests.where(customer_search_term.where_clause,
                                  customer_search_term.where_args).
                          order(customer_search_term.order).
                          paginate(:page => params[:page], :per_page => 12)
    else
      @guests = @event.guests.paginate(:page => params[:page], :per_page => 12)
    end
    
    #@guests = @event.guests.all
  end
  
  def meal_selection(guest)
    return 'Meal'.html_safe
  end
  
  def update_status
    @event = Event.friendly.find(params[:event_id])
    @guest = @event.guests.find(params[:id])
    
    if @guest != nil?
      puts @guest.guest_status
      if @guest.guest_status != true
        @guest.update_attributes(:guest_status => true)
      else
        @guest.update_attributes(:guest_status => false)
      end
    else
      #throw an error
    end
  end
  

  
  def new
    @event = Event.friendly.find(params[:event_id])
    @guest = @event.guests.new
  end

  def create
    @event = Event.friendly.find(params[:event_id])
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