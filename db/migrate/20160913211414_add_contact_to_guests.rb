class AddContactToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :phone, :integer
    add_column :guests, :guest_status, :string
  end
end
