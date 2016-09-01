class Event < ApplicationRecord
  belongs_to :user
  has_many :guests
  
  def list_events
  end
end
