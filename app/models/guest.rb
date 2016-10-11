class Guest < ApplicationRecord
  
  belongs_to :party
  belongs_to :event
  

end
