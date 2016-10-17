class AddEmailIndexToGuests < ActiveRecord::Migration[5.0]
  def change
    add_index :guests, :email
  end
end
