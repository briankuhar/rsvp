class Party < ApplicationRecord
  validates :party_name,  presence: true
  
  belongs_to :event
  has_many :guests
end