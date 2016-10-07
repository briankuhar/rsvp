class AddIndexToSlug < ActiveRecord::Migration[5.0]
  def change
    add_index :events, :slug
  end
end
