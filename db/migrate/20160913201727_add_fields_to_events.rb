class AddFieldsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_name, :string
    add_column :events, :event_rsvp_date, :date
    
    change_column :events, :event_date, :date
  end
end
