class Party < ApplicationRecord
  
  belongs_to :event
  has_many :guests, inverse_of: :party
  accepts_nested_attributes_for :guests, :reject_if => proc { |attributes| attributes['last_name'].blank?  }
  
end