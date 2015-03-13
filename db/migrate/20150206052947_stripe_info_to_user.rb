class StripeInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :subscribed, :boolean
    add_column :users, :stripe_customer_id, :string
  end
end
