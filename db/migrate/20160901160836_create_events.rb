class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.belongs_to :user, index: true
      t.string :type
      t.datetime :event_date
      
      t.timestamps
    end
  end
end
