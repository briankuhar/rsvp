class ChangeUsersForPgDeploy < ActiveRecord::Migration[5.0]
  def change
    change_column :guests, :guest_status, 'boolean USING guest_status::boolean'
  end
end
