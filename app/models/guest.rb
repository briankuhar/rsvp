require 'elasticsearch/model'

class Guest < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  belongs_to :party
  belongs_to :event
  

end

Guest.import force: true