class Party < ApplicationRecord
  
  belongs_to :event
  has_many :guests, inverse_of: :party
  accepts_nested_attributes_for :guests, :reject_if => proc { |attribute| attribute[:last_name].blank? }
  validate :validate_nested_attributes
  
  def validate_nested_attributes
    guests.each do |guest|
      errors.add(:first_name, "cannot be blank") if guest.first_name.blank?
      errors.add(:email, "must be valid") if !email_is_valid(guest.email)
    end
  end
  
  def email_is_valid(email)
    email =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  end
  
end