class AddStripeToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :stripe_customer_token, :string
  end
end
