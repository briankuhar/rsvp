class Guest < ApplicationRecord
  
  belongs_to :party
  belongs_to :event
  
  #def self.search(search)
  #  if search
  #    find(:all, :conditions => ['last_name LIKE ?', "%#{search}%"])
  #  else
  #    find(:all)
  #  end
  #end
end
