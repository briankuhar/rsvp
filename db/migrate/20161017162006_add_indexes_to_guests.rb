class AddIndexesToGuests < ActiveRecord::Migration[5.0]
  def change
    add_index :guests, :first_name
    add_index :guests, :last_name
  end
end
