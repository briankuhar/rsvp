class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.belongs_to :event, index: true
      t.string :party_name
      
      t.timestamps
    end
  end
end
