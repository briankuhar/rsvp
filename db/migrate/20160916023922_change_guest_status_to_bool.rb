class ChangeGuestStatusToBool < ActiveRecord::Migration[5.0]
  def change
    change_column :guests, :guest_status, 'boolean USING CAST(guest_status AS boolean)'
  end
end
