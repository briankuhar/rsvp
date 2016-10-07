class AddPathToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :path, :string
    add_index :events, :path, :unique => true
  end
end
