class AddLowerIndexesToGuests < ActiveRecord::Migration[5.0]
  def up
    execute %{
      CREATE INDEX
        guests_lower_last_name
      ON
        guests (lower(last_name) varchar_pattern_ops)
    }
    execute %{
      CREATE INDEX
        guests_lower_first_name
      ON
        guests (lower(first_name) varchar_pattern_ops)
    }
    execute %{
      CREATE INDEX
        guests_lower_email
      ON
        guests (lower(email))
    }
  end
  
  def down
    remove_index :guests, name: 'guests_lower_email'
    remove_index :guests, name: 'guests_lower_first_name'
    remove_index :guests, name: 'guests_lower_last_name'
  end
end
