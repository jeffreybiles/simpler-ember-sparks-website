class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include Stripe::Callbacks

  after_customer_updated! do |customer, event|
    user = User.find_by_stripe_customer_id(customer.id)
    if customer.delinquent
      user.subscribed = false
      user.save!
    end
  end
end
