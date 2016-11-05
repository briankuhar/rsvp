class EventsController < ApplicationController
  layout :resolve_layout
  
  before_action :authenticate_user!, only: [:index, :edit, :update, :create]
  before_action :process_dates, only: [:create, :update]


  def index
    @user = current_user
    unless @user.blank?
      @events = @user.events.paginate(:page => params[:page], :per_page => 3)
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
    @event_detail = EventDetail.create(params[:event_detail])
    @event.event_detail = @event_detail
    @event.path = @event.event_name.gsub(/[^0-9a-z\\s]/i, '').downcase
    if @event.save_with_payment
      flash[:success] = "Event created successfully"
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
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  def search
    @event = Event.friendly.find(params[:event_id])
    if params[:q].nil?
      @guests = []
    else
      @guests = @event.guests.search params[:q]
    end
  end
  
  def rsvp
    @event = Event.friendly.find(params[:id])
    if params[:keywords].present?
      @keywords = params[:keywords]
      customer_search_term = GuestSearchTerm.new(@keywords)
      @guests = @event.guests.where(customer_search_term.where_clause,
                                  customer_search_term.where_args).
                          order(customer_search_term.order).
                          paginate(:page => params[:page], :per_page => 12)
    else
      @guests = []
    end
  end
  
  def process_dates
    [:event_date, :event_rsvp_date].each do |d|
      # assuming 'mm/dd/yyyy' format
      date = params[:event][d]
      date_parts = date.split('/')
      # swap date and month
      date_parts[0], date_parts[1] = date_parts[1], date_parts[0]
      params[:event][d] = date_parts.join('/')
    end
  end
  
  def destroy
    Event.friendly.find(params[:id]).destroy
    puts '=-=-=-=-=-=-=-DELETED=-=-=-=-=-=-=-='
    redirect_to root_path
  end
  
  
  private
  
    def event_params
      params.require(:event).permit( :event_type, :event_date, :event_name, 
                                    :event_rsvp_date, :stripe_card_token, :path,
                                    :user_email, event_detail_attributes: [ :id,
                                      :event_id, :venue_name, :venue_city,
                                      :venue_street_addr1, :venue_street_addr2,
                                      :venue_state, :venue_zip, :event_info,
                                      :event_photo, :event_theme, :event_accom,
                                      :event_transport
                                    ])
    end

    def resolve_layout
      case action_name
      when "show"
        "rsvp"
      when "rsvp"
        "rsvp"
      else
        "application"
      end
    end
  
end