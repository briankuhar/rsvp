class Event < ApplicationRecord
  validates :event_type,        presence: true
  validates :event_date,        presence: true
  validates :event_name,        presence: true
  validates :event_rsvp_date,   presence: true
  
  belongs_to :user
  has_many :guests
  
  def list_events
  end
end
