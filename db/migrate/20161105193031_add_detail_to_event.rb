class AddDetailToEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :event_detail, foreign_key: true
  end
end
