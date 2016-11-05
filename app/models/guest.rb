require 'elasticsearch/model'

class Guest < ApplicationRecord
  belongs_to :party
  belongs_to :event
  
  def as_json(options={})
    options[:methods] = [:full_name]
    super
  end
  
  def full_name
    [first_name, last_name].compact.join(' ')
  end
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

end