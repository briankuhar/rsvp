class AddPartyToGuests < ActiveRecord::Migration[5.0]
  def change
    add_reference :guests, :party, foreign_key: true
  end
end
