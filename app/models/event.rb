class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :path
  validates :event_type,        presence: true
  validates :event_date,        presence: true
  validates :event_name,        presence: true
  validates :event_rsvp_date,   presence: true
  
  belongs_to :user
  has_many :parties
  has_many :guests
  has_one :event_detail, :dependent => :destroy
  accepts_nested_attributes_for :guests, :reject_if => proc { |attributes| attributes['last_name'].blank?  }
  accepts_nested_attributes_for :event_detail, :allow_destroy => true
  attr_accessor :slug
  attr_accessor :stripe_card_token
  attr_accessor :user_email
  
  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end
  
  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(
        :source => stripe_card_token,
        :description => "Customer for " + user_email)
      Stripe::Charge.create(:amount => 4999, 
                          :currency => "usd", 
                          :customer => customer,
                          :description => user_email + " - " + event_name)
      save!
    end
  end
  
end
