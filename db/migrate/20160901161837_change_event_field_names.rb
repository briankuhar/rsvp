class ChangeEventFieldNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :type, :event_type
    change_column :events, :event_date, :date
  end
end
