class CreateEventDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :event_details do |t|
      t.string :venue_name
      t.string :venue_street_addr1
      t.string :venue_street_addr2
      t.string :venue_city
      t.string :venue_state
      t.string :venue_zip
      t.text :event_info
      t.string :event_photo
      t.integer :event_theme
      t.text :event_accom
      t.text :event_transport
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
